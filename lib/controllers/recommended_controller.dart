import 'package:cjays/data/repository/recommended_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedController extends GetxController {
  final RecommendedRepository recommendedRepository;

  RecommendedController({required this.recommendedRepository});

  List<dynamic> _recommendedList = [];

  List<dynamic> get recommendedList => _recommendedList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedList() async {
    Response response = await recommendedRepository.getRecommendedList();

    if (response.statusCode == 200) {
      _recommendedList = [];

      // _recommendedList.addAll(
      //   response.body.map((e) => Recommended.fromJson(e)).toList(),
      // );

      debugPrint('Recommended List: ${_recommendedList.length}');

      _isLoaded = true;
      update();
    } else {
      Get.snackbar(
        'Error Occurred',
        response.statusText.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }
}
