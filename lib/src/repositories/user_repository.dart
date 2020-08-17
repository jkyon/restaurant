import 'package:restaurant_finder/src/dal/dal.dart';
import 'package:restaurant_finder/src/models/models.dart';

class UserRepository {
  final IDatabaseManager databaseManager;

  UserRepository({this.databaseManager});

  Future<bool> createUser(User user) async {
    try {
      var isOpen = await this.databaseManager.open();
      if (isOpen) {
        var params = {
          "Name": user.name,
          "Password": user.password,
          "UserName": user.userName,
        };

        return await this.databaseManager.create("User", params);
      }
      return false;
    } catch (e) {
      throw e;
    } finally {
      await this.databaseManager.close();
    }
  }

  Future<User> getUser(String userName, String password) async {
    try {
      await this.databaseManager.open();
      var fields = ["Id", "Name", "Password", "UserName"];

      var result = await this
          .databaseManager
          .getRecord("User", userName, "UserName", fields);

      if (result != null) {
        var item = result.first;

        var user = User(
          id: item["Id"],
          name: item["Name"].toString(),
          userName: item["UserName"].toString(),
          password: item["Password"].toString(),
        );

        return user;
      }

      return User();
    } catch (e) {
      throw e;
    } finally {
      await this.databaseManager.close();
    }
  }
}
