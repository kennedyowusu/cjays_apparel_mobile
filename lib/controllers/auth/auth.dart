import 'dart:convert';

import 'package:cjays/service/auth/auth.dart';
import 'package:cjays/utils/secure_storage.dart';
import 'package:cjays/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  AuthService authService = AuthService();
  UserSecureStorage userSecureStorage = UserSecureStorage();

  String name = '';
  String phone = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  var isLoading = false.obs;

  Future createUserAccount() async {
    try {
      isLoading.value = true;
      http.Response response = await authService.signUpUser(
        name,
        email,
        phone,
        password,
        confirmPassword,
      );
      Map<String, dynamic> responseData = json.decode(response.body);
      isLoading.value = false;
      if (response.statusCode == 200) {
        Get.offAll(() => HomeScreen());
      } else {
        Get.snackbar(
          "Error Occurred",
          responseData['error'],
        );
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }

  Future signInUser() async {
    try {
      isLoading.value = true;
      http.Response response = await authService.signInUser(
        email,
        password,
      );
      Map<String, dynamic> responseData = json.decode(response.body);
      isLoading.value = false;
      if (response.statusCode == 200) {
        Get.offAll(() => HomeScreen());
      } else {
        Get.snackbar(
          "Error Occurred",
          responseData['error'],
        );
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }
}
