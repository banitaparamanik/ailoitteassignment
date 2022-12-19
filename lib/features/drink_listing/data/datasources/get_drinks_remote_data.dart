import 'package:dio/dio.dart';

abstract class GetDrinkRemoteData {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<dynamic> get(String apiPath);

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
 dynamic getResponse(Response response);
}