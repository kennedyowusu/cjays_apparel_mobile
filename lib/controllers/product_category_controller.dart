import 'package:cjays/data/repository/product_category_repo.dart';
import 'package:cjays/models/category.dart';
import 'package:cjays/models/product_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoryController extends GetxController {
  ProductCategoryRepository productCategoryRepository =
      ProductCategoryRepository(apiClient: Get.find());
  final Category category;

  ProductCategoryController({required this.category});

  List<ProductsCategory> _productCategoryList = [];

  List<ProductsCategory> get productCategoryList => _productCategoryList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  RxList<ProductsCategory> categoryList = <ProductsCategory>[].obs;

  @override
  onInit() {
    super.onInit();
    getProductCategoryList(category.id);
  }

  Future<void> getProductCategoryList(id) async {
    Response response =
        await productCategoryRepository.getProductCategoryList(id);

    if (response.statusCode == 200) {
      debugPrint('Product Category List: ${response.body}');
      _productCategoryList = [];

      for (var item in response.body) {
        _productCategoryList.add(ProductsCategory.fromJson(item));
      }

      categoryList(_productCategoryList);

      debugPrint('Product Category List: ${_productCategoryList.length}');

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
