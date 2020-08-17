import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_finder/src/models/models.dart';
import 'package:restaurant_finder/src/repositories/exceptions/repository_exception.dart';
import 'package:restaurant_finder/src/repositories/restaurant_repository.dart';

part 'restaurant_finder_event.dart';
part 'restaurant_finder_state.dart';

class RestaurantFinderBloc
    extends Bloc<RestaurantFinderEvent, RestaurantFinderState> {
  final RestaurantRepository repository;

  RestaurantFinderBloc({this.repository}) : super(RestaurantFinderInitial());

  @override
  Stream<RestaurantFinderState> mapEventToState(
    RestaurantFinderEvent event,
  ) async* {
    if (event is FetchRestaurantEvent) {
      yield RestaurantLoadingState();

      try {
        var useLatLong = event.cityName == null ? true : false;

        var cityInfo = await this.repository.getCityByName(
            useLatLong, event.cityName, event.longitude, event.latitude);

        var restaurants = cityInfo.id == null
            ? List<Restaurant>()
            : await this.repository.getRestaurantList(useLatLong,
                int.parse(cityInfo.id), event.longitude, event.latitude);

        if (event.completer != null) event.completer.complete();

        yield SuccessLoadRestaurant(restaurants: restaurants);
      } on RepositoryException catch (_) {
        if (event.completer != null) event.completer.complete();
        yield FailedLoadRestaurant(errorMessage: "Error");
        rethrow;
      }
    }
  }
}
