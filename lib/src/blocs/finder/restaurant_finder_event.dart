part of 'restaurant_finder_bloc.dart';

abstract class RestaurantFinderEvent extends Equatable {
  const RestaurantFinderEvent();

  @override
  List<Object> get props => [];
}

class FetchRestaurantEvent extends RestaurantFinderEvent {
  final String longitude;
  final String latitude;
  final String cityName;
  final Completer completer;

  FetchRestaurantEvent(
      {this.cityName, this.longitude, this.latitude, Completer completer})
      : completer = completer ?? Completer();

  @override
  List<Object> get props => [cityName, longitude, latitude, completer];
}
