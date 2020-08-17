import 'package:flutter/material.dart';
import 'package:restaurant_finder/src/components/restaurants/restaurant_item.dart';

import 'package:restaurant_finder/src/models/restaurant.dart';

class RestaurantListView extends StatefulWidget {
  final List<Restaurant> restaurantData;
  final Function(String text) onChnaged;
  const RestaurantListView({Key key, this.restaurantData, this.onChnaged})
      : super(key: key);

  @override
  _RestaurantListViewState createState() => _RestaurantListViewState();
}

class _RestaurantListViewState extends State<RestaurantListView> {
  Widget appBarTitle = Text('Search City');
  Icon actionIcon = Icon(Icons.search);
  String _searchValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: appBarTitle,
            actions: <Widget>[_iconButton()]),
        body: Container(
            padding: new EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: widget.restaurantData.length,
              itemBuilder: (BuildContext context, int index) {
                final item = widget.restaurantData[index];
                return RetaurantItem(restaurantItem: item);
              },
            )));
  }

  Widget _iconButton() {
    return IconButton(
      icon: actionIcon,
      onPressed: () {
        setState(() {
          if (actionIcon.icon == Icons.search) {
            actionIcon = Icon(Icons.close);
            appBarTitle = TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Search City...',
                  hintStyle: TextStyle(color: Colors.white)),
              onChanged: (String searchValue) {
                _searchValue = searchValue;
              },
              onEditingComplete: () {
                widget.onChnaged(_searchValue);
              },
            );
          } else {
            actionIcon = Icon(Icons.search);
            appBarTitle = Text('Search City');
          }
        });
      },
    );
  }
}
