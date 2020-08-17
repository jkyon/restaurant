import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String userName;
  final String password;

  User({this.id, this.name, this.userName, this.password});
  @override
  List<Object> get props => [this.id, this.name, this.userName, this.password];
}
