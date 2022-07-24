import 'dart:convert';

import 'package:cjays/service/auth/auth.dart';
import 'package:cjays/utils/secure_storage.dart';
import 'package:cjays/views/auth/signin/sign_in.dart';
import 'package:cjays/views/home/home.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  AuthService authService = AuthService();

  String name = '';
  String phone = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  UserSecureStorage userSecureStorage = UserSecureStorage();

  Future createUserAccount() async {
    http.Response response = await authService.signUpUser(
      name,
      email,
      phone,
      password,
      confirmPassword,
    );
    Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      Get.offAll(() => HomeScreen());
      userSecureStorage.writeSecureData(
        'email',
        email,
      );
    } else {
      Get.snackbar(
        "Error Occurred",
        responseData['error'],
      );
    }
  }

  Future signInUser() async {
    http.Response response = await authService.signInUser(
      email,
      password,
    );
    Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      Get.offAll(() => HomeScreen());
      userSecureStorage.writeSecureData(
        'email',
        email,
      );
    } else {
      Get.snackbar(
        "Error Occurred",
        responseData['error'],
      );
    }
  }

  Future signOut() async {
    await authService.signOutUser();
    userSecureStorage.deleteSecureData('email');
    Get.offAll(() => LoginScreen());
  }
}
