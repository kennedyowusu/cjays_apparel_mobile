import 'package:cjays/data/repository/cart_repo.dart';
import 'package:cjays/models/Cart.dart';
import 'package:cjays/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepository cartRepository;

  CartController({required this.cartRepository});

  Map<int, CartModel> items = {};

  List<CartModel> storageItems = [];

  void addItem(Product product, int quantity) {
    int totalQuantity = 0;

    debugPrint("Length of items: ${items.length}");
    if (items.containsKey(product.id)) {
      items.update(
        product.id!,
        (CartModel existingItem) {
          totalQuantity = existingItem.quantity + quantity;

          return CartModel(
            id: existingItem.id,
            name: existingItem.name,
            price: existingItem.price,
            image: existingItem.image,
            quantity: existingItem.quantity + quantity,
            isExist: existingItem.isExist,
            time: existingItem.time,
            product: existingItem.product,
          );
        },
      );
      if (totalQuantity <= 0) {
        items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        items.putIfAbsent(
          product.id!,
          () {
            debugPrint(
                "adding to the cart id ${product.id!} & product quantity is $quantity");

            items.forEach((key, value) {
              debugPrint("key: $key & value: ${value.quantity.toString()}");
            });
            return CartModel(
              id: product.id!,
              name: product.name!,
              price: int.parse(product.price!.split('.').first),
              image: product.image!,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: product,
            );
          },
        );
      } else {
        showSnackBar("Oops", "Item Quantity can't be 0");
        debugPrint("quantity is 0");
      }
    }

    cartRepository.addToCartList(getItems);
    update();
  }

  bool existInCart(Product product) {
    if (items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(Product product) {
    int quantity = 0;
    if (items.containsKey(product.id!)) {
      items.forEach((key, value) {
        if (key == product.id!) {
          quantity = value.quantity;
        }
      });
    }
    return quantity;
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

  int get totalItems {
    int totalQuantity = 0;
    items.forEach((key, value) {
      totalQuantity += value.quantity;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    List<CartModel> cartItems = [];
    return items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    int totalAmount = 0;
    items.forEach((key, value) {
      totalAmount += value.price * value.quantity;
    });
    return totalAmount;
  }

  List<CartModel> getCartData() {
    setCartData = cartRepository.getCartList();
    return storageItems;
  }

  set setCartData(List<CartModel> cartList) {
    storageItems = cartList;

    debugPrint("Length of storageItems are: ${storageItems.length}");

    for (int i = 0; i < storageItems.length; i++) {
      items.putIfAbsent(
        storageItems[i].product.id!,
        () => storageItems[i],
      );
    }
  }
}
