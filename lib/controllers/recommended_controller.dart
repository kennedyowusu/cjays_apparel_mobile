import 'package:cjays/data/repository/recommended_repo.dart';
import 'package:cjays/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedController extends GetxController {
  final RecommendedRepository recommendedRepository;

  RecommendedController({required this.recommendedRepository});

  List<Product> _recommendedList = [];

  List<Product> get recommendedList => _recommendedList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedList() async {
    Response response = await recommendedRepository.getRecommendedList();

    if (response.statusCode == 200) {
      debugPrint('Recommended List: ${response.body}');
      _recommendedList = [];

      for (var item in response.body) {
        _recommendedList.add(Product.fromJson(item));
      }

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
