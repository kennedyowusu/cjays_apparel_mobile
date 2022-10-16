import 'package:cjays/controllers/cart_controller.dart';
import 'package:cjays/data/repository/product_repo.dart';
import 'package:cjays/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepository productRepository;

  ProductController({required this.productRepository});

  List<Product> _productList = [];

  List<Product> get productList => _productList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  late CartController _cartController;

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
    if ((_inCartItems + quantity) < 0) {
      showSnackBar("Sorry", "Quantity can't be less than 0");
      return 0;
    } else if ((_inCartItems + quantity) > 10) {
      showSnackBar("Oops", "Quantity can't be more than 10");
      return 10;
    } else {
      return quantity;
    }
  }

  void initProduct(Product product, CartController cartController) {
    _quantity = 0;
    _inCartItems = 0;
    _cartController = cartController;

    bool exist = false;

    exist = _cartController.existInCart(product);

    debugPrint("exist: $exist");

    if (exist) {
      _inCartItems = _cartController.getQuantity(product);
    }
    debugPrint("Total quantity in the Cart is $_inCartItems");
  }

  void addItem(
    Product product,
  ) {
    // if (_quantity > 0) {
    _cartController.addItem(product, _quantity);
    _quantity = 0;

    _inCartItems = _cartController.getQuantity(product);

    _cartController.items.forEach((key, value) {
      debugPrint("key is: $key & value is: ${value.quantity.toString()}");
    });
    // } else {
    //   showSnackBar("Oops", "Item Quantity can't be 0");
    // }
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
