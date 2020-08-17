part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => null;
}

class InitialCreatingUserState extends LoginState {
  @override
  List<Object> get props => null;
}

class CreatingUserState extends LoginState {
  @override
  List<Object> get props => null;
}

class SuccessCreateUserState extends LoginState {
  final bool created;

  SuccessCreateUserState({this.created});

  @override
  List<Object> get props => [created];
}

class FailedCreateUserState extends LoginState {
  final String errorMessage;

  FailedCreateUserState({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class LoginUserProcess extends LoginState {
  @override
  List<Object> get props => null;
}

class LoginSuccess extends LoginState {
  final User userInfo;

  LoginSuccess({this.userInfo});

  @override
  List<Object> get props => [userInfo];
}

class LoginFailed extends LoginState {
  final String userName;
  final String password;
  final String errorMessage;

  LoginFailed({this.userName, this.password, this.errorMessage});

  @override
  List<Object> get props => [this.userName, this.password];
}
