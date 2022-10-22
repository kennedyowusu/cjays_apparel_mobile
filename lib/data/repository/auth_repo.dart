import 'package:cjays/data/api/api_client.dart';
import 'package:cjays/models/auth.dart';
import 'package:cjays/models/sign_in';
import 'package:cjays/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {
  final ApiClient apiClient;
  final SharedPreferences preferences;

  AuthenticationRepository({
    required this.apiClient,
    required this.preferences,
  });

  Future<Response> registration(AuthModel authModel) async {
    return await apiClient.postData(
      ProjectConstants.REGISTRATION_URL,
      authModel.toJson(),
    );
  }

  bool isUserLoggedIn() {
    return preferences.containsKey(ProjectConstants.TOKEN);
  }

  Future<String> getUserToken() async {
    return preferences.getString(ProjectConstants.TOKEN) ?? '';
  }

  Future<Response> loginUser(SignInModel signInModel) async {
    return await apiClient.postData(
      ProjectConstants.LOGIN_URL,
      signInModel.toJson(),
    );
  }

  Future<bool> saveUserToken(
    String token,
  ) async {
    apiClient.token = token;
    apiClient.updateHeaders(token);
    return await preferences.setString(
      ProjectConstants.TOKEN,
      token,
    );
  }

  Future<void> saveUserLoginData(String email, String password) async {
    try {
      await preferences.setString(ProjectConstants.EMAIL, email);
      await preferences.setString(ProjectConstants.PASSWORD, password);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool logUserOut() {
    preferences.remove(ProjectConstants.TOKEN);
    preferences.remove(ProjectConstants.EMAIL);
    preferences.remove(ProjectConstants.PASSWORD);
    apiClient.token = '';
    apiClient.updateHeaders('');

    return true;
  }
}
