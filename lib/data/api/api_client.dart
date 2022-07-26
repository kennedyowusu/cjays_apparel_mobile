import 'package:cjays/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late SharedPreferences preferences;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.preferences}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = preferences.getString(ProjectConstants.TOKEN) ?? "";

    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  void updateHeaders(String headers) {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // A request to get data from the server
  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      Response response = await get(uri, headers: headers ?? _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  // A request to post data to the server
  Future<Response> postData(String uri, Map<String, dynamic> body) async {
    debugPrint(body.toString());
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
