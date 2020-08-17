import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final String id;
  final String name;
  final String city;
  final String address;

  Restaurant({
    this.id,
    this.name,
    this.city,
    this.address,
  });

  static List<Restaurant> fromJson(dynamic json) {
    var healthCollection = List<Restaurant>();
    for (var item in json["restaurants"]) {
      healthCollection.add(Restaurant(
          id: item["restaurant"]["id"],
          name: item["restaurant"]["name"],
          city: item["restaurant"]["location"]["city"],
          address: item["restaurant"]["location"]["address"]));
    }
    return healthCollection;
  }

  @override
  List<Object> get props => [
        this.id,
        this.name,
        this.city,
        this.address,
      ];
}
