import 'dart:convert';

import 'package:ailoitteassignment/core/error/exceptions.dart';
import 'package:ailoitteassignment/features/drink_listing/data/datasources/get_drinks_remote_data.dart';
import 'package:dio/dio.dart';

class NetworkManager extends GetDrinkRemoteData {
  @override
  Future<dynamic> get(String apiPath) async {
    try {
      final response = await Dio().get(apiPath);

      final responseJson = getResponse(response);
      return responseJson;
    } catch (_) {
      // return CacheFailure();
    }
  }

  @override
  dynamic getResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      default:
        throw ServerException();
    }
  }

}
