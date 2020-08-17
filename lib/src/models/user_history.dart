import 'package:equatable/equatable.dart';

class UserHistory extends Equatable {
  final int id;
  final int userId;
  final int cityId;
  final String userName;
  final String cityName;
  final int restaurantFound;

  UserHistory(
      {this.id,
      this.userId,
      this.cityId,
      this.userName,
      this.cityName,
      this.restaurantFound});
  @override
  List<Object> get props => [
        this.id,
        this.userId,
        this.cityId,
        this.userName,
        this.cityName,
        this.restaurantFound
      ];
}
