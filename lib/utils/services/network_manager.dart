import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkManager {
  Future<dynamic> get(String url) async {
    try {
      final response = await Dio().get(url);

      final responseJson = _response(response);
      return responseJson;
    } catch (_) {}
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      default:
        throw Exception();
    }
  }
}
