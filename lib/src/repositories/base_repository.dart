import 'package:restaurant_finder/src/api/api.dart';

abstract class BaseApiRepository {
  ApiClient apiClient;

  BaseApiRepository({
    this.apiClient = const ApiClient(),
  });
}
