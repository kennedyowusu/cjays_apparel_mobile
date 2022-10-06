import 'package:cjays/data/repository/product_repo.dart';
import 'package:cjays/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepository productRepository;

  ProductController({required this.productRepository});

  List<Product> _productList = [];

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<Product> get productList => _productList;

  Future<void> getProductList() async {
    Response response = await productRepository.getProductList();

    if (response.statusCode == 200) {
      debugPrint('Product List: ${response.body}');
      _productList = [];

      for (var item in response.body) {
        _productList.add(Product.fromJson(item));
      }
      debugPrint('Product List: ${_productList.length}');
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
