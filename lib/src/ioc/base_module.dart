import 'package:get_it/get_it.dart';
import 'package:restaurant_finder/src/blocs/finder/restaurant_finder_bloc.dart';
import 'package:restaurant_finder/src/blocs/history/history_bloc.dart';
import 'package:restaurant_finder/src/blocs/login/login_bloc.dart';
import 'package:restaurant_finder/src/dal/dal.dart';
import 'package:restaurant_finder/src/repositories/repositories.dart';

abstract class BaseModule {
  void setup(GetIt serviceLocator);
}

class AppMobileModule implements BaseModule {
  @override
  void setup(GetIt serviceLocator) {
    serviceLocator.registerSingleton<IDatabaseManager>(DatabaseManager());

    serviceLocator.registerFactory(() => RestaurantRepository());
    serviceLocator.registerFactory(() => UserRepository(
        databaseManager: serviceLocator.get<IDatabaseManager>()));
    serviceLocator.registerFactory(() => UserHistoryRepository(
        databaseManager: serviceLocator.get<IDatabaseManager>()));
    serviceLocator.registerSingleton<RestaurantFinderBloc>(RestaurantFinderBloc(
        repository: serviceLocator.get<RestaurantRepository>()));
    serviceLocator.registerSingleton<LoginBloc>(
        LoginBloc(userRepository: serviceLocator.get<UserRepository>()));
    serviceLocator.registerSingleton<HistoryBloc>(HistoryBloc(
        historyRepository: serviceLocator.get<UserHistoryRepository>()));
  }
}

class MobileContainer {
  final GetIt _resolver;

  MobileContainer._() : _resolver = GetIt.instance;

  static final MobileContainer _instance = new MobileContainer._();

  factory MobileContainer() => _instance;

  void startModule(BaseModule module) {
    module.setup(_resolver);
  }

  T get<T>() {
    return _resolver.get<T>();
  }
}
