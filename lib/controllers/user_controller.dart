import 'package:cjays/data/repository/user_repo.dart';
import 'package:cjays/models/response.dart';
import 'package:cjays/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  final UserRepository userRepository;

  UserController({required this.userRepository});

  bool isLoading = false;

  UserModel userModel = UserModel();

  Future<ResponseModel> getUserData() async {
    Response response = await userRepository.getUserData();
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      userModel = UserModel.fromJson(response.body);

      isLoading = true;
      responseModel = ResponseModel(true, "Success");
    } else {
      debugPrint("Cannot get user data ${response.statusText}");
      responseModel = ResponseModel(false, response.statusText!);
    }

    update();
    return responseModel;
  }
}
