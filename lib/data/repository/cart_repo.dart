import 'dart:convert';

import 'package:cjays/models/Cart.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  final SharedPreferences preferences;

  CartRepository({required this.preferences});

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    cartList.forEach((element) {
      return cart.add(jsonEncode(element));
    });

    preferences.setStringList(
      ProjectConstants.CART_LIST,
      cart,
    );
    debugPrint(
      preferences
          .getStringList(
            ProjectConstants.CART_LIST,
          )
          .toString(),
    );

    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];

    if (preferences.containsKey(ProjectConstants.CART_LIST)) {
      carts = preferences.getStringList(
        ProjectConstants.CART_LIST,
      )!;

      debugPrint("Cart List: $carts");
    }

    final List<CartModel> cartList = [];

    carts.forEach((e) {
      cartList.add(
        CartModel.fromJson(
          jsonDecode(e),
        ),
      );
    });

    // carts.forEach((element) => CartModel.fromJson(jsonDecode(element)));

    return cartList;
  }

  // void removeFromCart(Cart cart) {
  //   final List<Cart> cartItems = getCartItems();
  //   cartItems.removeWhere((element) => element.id == cart.id);
  //   preferences.setStringList(
  //       'cart', cartItems.map((e) => json.encode(e.toJson())).toList());
  // }

  // void clearCart() {
  //   preferences.remove('cart');
  // }
}
