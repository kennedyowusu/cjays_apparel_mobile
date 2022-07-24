import 'dart:convert';

import 'package:cjays/service/endpoints/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  ProjectApis projectApis = ProjectApis();

  Future<http.Response> signUpUser(
    String name,
    String email,
    String phone,
    String password,
    String confirmPassword,
  ) async {
    Map data = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation': confirmPassword,
    };
    var body = json.encode(data);
    var url = Uri.parse(projectApis.registerUrl);

    var response = await http.post(
      url,
      body: body,
      headers: projectApis.headers,
    );
    debugPrint(response.body);
    return response;
  }

  Future<http.Response> signInUser(
    String email,
    String password,
  ) async {
    Map data = {
      'email': email,
      'password': password,
    };
    var body = json.encode(data);
    var url = Uri.parse(projectApis.loginUrl);

    var response = await http.post(
      url,
      body: body,
      headers: projectApis.headers,
    );
    debugPrint(response.body);
    return response;
  }

  Future<http.Response> signOutUser() async {
    var url = Uri.parse(projectApis.logoutUrl);
    var response = await http.get(
      url,
      headers: projectApis.headers,
    );
    return response;
  }
}
