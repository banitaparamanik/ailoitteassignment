import 'package:dio/dio.dart';

abstract class GetDrinkRemoteData {
  ///
  /// Throws a [ServerException] for all error codes.
  Future<dynamic> get(String apiPath);

  ///
  /// Throws a [ServerException] for all error codes.
 dynamic getResponse(Response response);
}