import 'package:restaurant_finder/src/dal/dal.dart';
import 'package:restaurant_finder/src/models/user_history.dart';

class UserHistoryRepository {
  final IDatabaseManager databaseManager;

  UserHistoryRepository({this.databaseManager});

  Future<List<UserHistory>> getHistory(int userId) async {
    try {
      var items = List<UserHistory>();

      var isOpen = await this.databaseManager.open();
      if (isOpen) {
        var results =
            await this.databaseManager.getRecords("UserHistory", orderBy: "Id");

        for (var item in results) {
          items.add(UserHistory(
            id: item["Id"],
            userName: item["UserName"],
            cityName: item["CityName"],
            restaurantFound: item["RestaurantFound"],
          ));
        }
      }

      return items;
    } catch (e) {
      throw e;
    }
  }
}
