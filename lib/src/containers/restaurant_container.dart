import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_finder/src/blocs/finder/restaurant_finder_bloc.dart';
import 'package:restaurant_finder/src/components/restaurants/restaurant_list_view.dart';
import 'package:restaurant_finder/src/components/widgets/Simple_progress_indicator.dart';
import 'package:restaurant_finder/src/ioc/base_module.dart';
import 'package:restaurant_finder/src/models/models.dart';

class RestaurantContainer extends StatefulWidget {
  RestaurantContainer({Key key}) : super(key: key);

  @override
  _RestaurantContainerState createState() => _RestaurantContainerState();
}

class _RestaurantContainerState extends State<RestaurantContainer> {
  Completer<void> _refreshCompleter;
  RestaurantFinderBloc _restaurantFinderBloc =
      MobileContainer().get<RestaurantFinderBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: _restaurantFinderBloc,
      builder: (BuildContext context, RestaurantFinderState state) {
        if (state is RestaurantLoadingState) {
          return SimpleProgressIndicator();
        } else if (state is SuccessLoadRestaurant) {
          return _buildRestauranView(false, state.restaurants);
        } else if (state is FailedLoadRestaurant) {
          return _buildRestauranView(false, []);
        } else {
          return _buildRestauranView(false, []);
        }
      },
    );
  }

  Widget _buildRestauranView(bool isCompleted, List<Restaurant> restaurants) {
    return RestaurantListView(
      restaurantData: restaurants,
      onChnaged: (String searchValue) {
        _refreshCompleter = Completer<void>();
        _restaurantFinderBloc
          ..add(FetchRestaurantEvent(
              cityName: searchValue, completer: _refreshCompleter));
        return _refreshCompleter.future;
      },
    );
  }
}
