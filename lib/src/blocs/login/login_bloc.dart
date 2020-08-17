import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:restaurant_finder/src/models/models.dart';
import 'package:restaurant_finder/src/repositories/repositories.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({this.userRepository}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is InitCreateUserEvent) {
      yield InitialCreatingUserState();
    }
    if (event is CreateUserEvent) {
      yield* _createUser(event.user);
    }
    if (event is LoginUserEvent) {
      yield* _loginUser(event.userName, event.password);
    }
  }

  Stream<LoginState> _createUser(User user) async* {
    yield CreatingUserState();

    try {
      var result = await userRepository.createUser(user);
      yield result
          ? SuccessCreateUserState(created: result)
          : FailedCreateUserState(errorMessage: "User could not be created!");
    } catch (_) {
      yield FailedCreateUserState(errorMessage: "User could not be created!");
      rethrow;
    }
  }

  Stream<LoginState> _loginUser(String userName, String password) async* {
    yield LoginUserProcess();

    try {
      var result = await userRepository.getUser(userName, password);
      yield result.id != 0
          ? LoginSuccess(userInfo: result)
          : LoginFailed(
              userName: userName,
              password: password,
              errorMessage: "Error login the user!");
    } catch (_) {
      yield LoginFailed(
          userName: userName,
          password: password,
          errorMessage: "Error login the user!");

      rethrow;
    }
  }
}
