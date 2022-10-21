import 'package:cjays/data/repository/auth_repo.dart';
import 'package:cjays/models/auth.dart';
import 'package:cjays/models/response.dart';
import 'package:cjays/models/sign_in';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController implements GetxService {
  final AuthenticationRepository authenticationRepository;

  AuthenticationController({required this.authenticationRepository});

  bool isLoading = false;

  Future<ResponseModel> registration(AuthModel authModel) async {
    isLoading = true;
    update();

    Response response = await authenticationRepository.registration(authModel);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      authenticationRepository.saveUserToken(response.body['token']);
      responseModel = ResponseModel(true, response.body['message']);
    } else {
      responseModel = ResponseModel(false, response.statusText.toString());
      debugPrint(response.statusText.toString());
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> loginUser(SignInModel signInModel) async {
    isLoading = true;
    update();

    Response response = await authenticationRepository.loginUser(signInModel);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      authenticationRepository.saveUserToken(response.body['token']);

      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText.toString());
    }
    isLoading = false;
    update();
    return responseModel;
  }

  void saveUserLoginData(String email, String password) {
    authenticationRepository.saveUserLoginData(email, password);
  }

  bool isUserLoggedIn() {
    return authenticationRepository.isUserLoggedIn();
  }
}
