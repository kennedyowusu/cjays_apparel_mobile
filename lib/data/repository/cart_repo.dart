import 'dart:convert';

import 'package:cjays/models/Cart.dart';
import 'package:cjays/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  final SharedPreferences preferences;

  CartRepository({required this.preferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    // preferences.remove(ProjectConstants.CART_LIST);
    // preferences.remove(ProjectConstants.CART_HISTORY_LIST);

    String time = DateTime.now().toString();

    cart = [];

    cartList.forEach((element) {
      element.time = time;
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

    // getCartList();
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

  List<CartModel> getCartHistoryList() {
    if (preferences.containsKey(ProjectConstants.CART_HISTORY_LIST)) {
      cartHistory = [];

      cartHistory = preferences.getStringList(
        ProjectConstants.CART_HISTORY_LIST,
      )!;

      debugPrint("Cart History: $cartHistory");
    }

    List<CartModel> cartHistoryList = [];

    cartHistory.forEach(
      (element) {
        cartHistoryList.add(
          CartModel.fromJson(
            jsonDecode(element),
          ),
        );
      },
    );

    return cartHistoryList;
  }

  void addToCartHistoryList() {
    if (preferences.containsKey(ProjectConstants.CART_HISTORY_LIST)) {
      cartHistory = preferences.getStringList(
        ProjectConstants.CART_HISTORY_LIST,
      )!;

      // preferences.setStringList(
      //   ProjectConstants.CART_HISTORY_LIST,
      //   cartHistory,
      // );
    }

    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
      debugPrint("Cart History List: ${cart[i]}");
    }

    removeFromCart();

    preferences.setStringList(
      ProjectConstants.CART_HISTORY_LIST,
      cartHistory,
    );

    debugPrint(
        "The length of cart history list: ${getCartHistoryList().length}");

    // debugPrint("The time for the order is ${getCartHistoryList().first.time}");

    for (int j = 0; j < getCartHistoryList().length; j++) {
      debugPrint(
        "The time for the order is ${getCartHistoryList()[j].time}",
      );
    }
  }

  void removeFromCart() {
    cart = [];
    preferences.remove(ProjectConstants.CART_LIST);
  }
}
