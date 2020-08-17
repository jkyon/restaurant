import 'package:flutter/material.dart';
import 'package:restaurant_finder/src/components/widgets/decorated_card_item.dart';
import 'package:restaurant_finder/src/components/widgets/decorated_list_tile.dart';
import 'package:restaurant_finder/src/models/restaurant.dart';

class RetaurantItem extends StatelessWidget {
  final Restaurant restaurantItem;
  const RetaurantItem({Key key, this.restaurantItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedCardItem(
        cardMargin: EdgeInsets.all(5),
        cardContent: DecoratedListTile(
          contentPadding: EdgeInsets.only(left: 5),
          leadingWidget: Icon(Icons.restaurant),
          title: restaurantItem.name,
          subtitle: restaurantItem.address,
        ));
  }
}
