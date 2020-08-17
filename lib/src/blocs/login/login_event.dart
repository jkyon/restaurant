part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class InitCreateUserEvent extends LoginEvent {
  List<Object> get props => null;
}

class CreateUserEvent extends LoginEvent {
  final User user;

  CreateUserEvent({this.user});
  @override
  List<Object> get props => [this.user];
}

class LoginUserEvent extends LoginEvent {
  final String userName;
  final String password;

  LoginUserEvent({this.userName, this.password});

  @override
  List<Object> get props => [this.userName, this.password];
}

class LogOutUserEvent extends LoginEvent {
  final String userName;

  LogOutUserEvent({this.userName});

  @override
  List<Object> get props => [userName];
}
