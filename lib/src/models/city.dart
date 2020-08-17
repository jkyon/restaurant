import 'package:equatable/equatable.dart';

class City extends Equatable {
  final String id;

  final String name;

  final String countryId;

  final String countryName;

  City({this.id, this.name, this.countryId, this.countryName});

  static City fromJson(dynamic json) {
    return City(
      id: json['id'],
      name: json['name'],
      countryId: json['countryId'],
      countryName: json['countryName'],
    );
  }

  @override
  List<Object> get props =>
      [this.id, this.name, this.countryId, this.countryName];
}
