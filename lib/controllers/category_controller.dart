import 'package:cjays/data/repository/category_repo.dart';
import 'package:cjays/models/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final CategoryRepository categoryRepository;

  CategoryController({required this.categoryRepository});

  List<Category> _categoryList = [];

  List<Category> get categoryList => _categoryList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getCategoryList() async {
    Response response = await categoryRepository.getCategoryList();

    if (response.statusCode == 200) {
      _categoryList = [];

      for (var item in response.body) {
        _categoryList.add(Category.fromJson(item));
      }

      debugPrint('Category List: ${_categoryList.length}');

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
