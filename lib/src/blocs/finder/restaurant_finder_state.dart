part of 'restaurant_finder_bloc.dart';

abstract class RestaurantFinderState extends Equatable {
  const RestaurantFinderState();
}

class RestaurantFinderInitial extends RestaurantFinderState {
  @override
  List<Object> get props => null;
}

class RestaurantLoadingState extends RestaurantFinderState {
  @override
  List<Object> get props => null;
}

class SuccessLoadRestaurant extends RestaurantFinderState {
  final List<Restaurant> restaurants;

  SuccessLoadRestaurant({this.restaurants});
  @override
  List<Object> get props => [restaurants];
}

class FailedLoadRestaurant extends RestaurantFinderState {
  final String errorMessage;

  FailedLoadRestaurant({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
