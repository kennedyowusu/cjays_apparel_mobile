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

  int _quantity = 0;
  int get quantity => _quantity;

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

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      showSnackBar("Sorry", "Quantity can't be less than 0");
      return 0;
    } else if (quantity > 10) {
      showSnackBar("Oops", "Quantity can't be more than 10");
      return 10;
    } else {
      return quantity;
    }
  }

  SnackbarController showSnackBar(String title, String message) {
    return Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.red,
    );
  }
}
