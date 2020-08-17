import 'dart:io';

import 'package:restaurant_finder/src/api/exceptions/api_exception.dart';
import 'package:restaurant_finder/src/models/city.dart';
import 'package:restaurant_finder/src/models/restaurant.dart';
import 'package:restaurant_finder/src/repositories/base_repository.dart';

import 'exceptions/exception_type.dart';
import 'exceptions/repository_exception.dart';

class RestaurantRepository extends BaseApiRepository {
  RestaurantRepository() : super();

  Future<List<Restaurant>> getRestaurantList(
      bool useLatLong, int cityId, String longitude, String latitude) async {
    try {
      var url = !useLatLong
          ? 'https://developers.zomato.com/api/v2.1/search?entity_id=$cityId'
          : 'https://developers.zomato.com/api/v2.1/search?lat=$latitude&lon=$longitude';
      final dynamic response = await apiClient.get(url, {
        'Content-Type': 'application/json',
        'user-key': 'f3f643ed0de03b5027f2444550fb2fec',
      });
      return Restaurant.fromJson(response);
    } on SocketException catch (soEx) {
      throw RepositoryException(
          errorType: ExceptionType.SocketException, message: soEx.message);
    } on HttpException catch (httpEx) {
      throw RepositoryException(
        errorType: ExceptionType.HttpException,
        message: httpEx.message,
      );
    } on FormatException catch (foEx) {
      throw RepositoryException(
          errorType: ExceptionType.FormatException, message: foEx.message);
    } on ApiException catch (apiEx) {
      throw RepositoryException(
          errorType: ExceptionType.ApiException,
          message: apiEx.message,
          code: apiEx.code.toString());
    } on TypeError catch (e) {
      throw RepositoryException(
          errorType: ExceptionType.TypeError,
          message: e.toString(),
          stackTrace: e.stackTrace);
    }
  }

  Future<City> getCityByName(bool useLatLong, String cityName, String longitude,
      String latitude) async {
    try {
      var url = !useLatLong
          ? 'https://developers.zomato.com/api/v2.1/cities?q=$cityName'
          : 'https://developers.zomato.com/api/v2.1/cities?lat=$latitude&lon=$longitude';
      final dynamic response = await apiClient.get(url, {
        'Content-Type': 'application/json',
        'user-key': 'f3f643ed0de03b5027f2444550fb2fec',
      });
      return response["location_suggestions"].length > 0
          ? City.fromJson(response["location_suggestions"][0])
          : City();
    } on SocketException catch (soEx) {
      throw RepositoryException(
          errorType: ExceptionType.SocketException, message: soEx.message);
    } on HttpException catch (httpEx) {
      throw RepositoryException(
        errorType: ExceptionType.HttpException,
        message: httpEx.message,
      );
    } on FormatException catch (foEx) {
      throw RepositoryException(
          errorType: ExceptionType.FormatException, message: foEx.message);
    } on ApiException catch (apiEx) {
      throw RepositoryException(
          errorType: ExceptionType.ApiException,
          message: apiEx.message,
          code: apiEx.code.toString());
    } on TypeError catch (e) {
      throw RepositoryException(
          errorType: ExceptionType.TypeError,
          message: e.toString(),
          stackTrace: e.stackTrace);
    }
  }
}
