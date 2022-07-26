import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isFavorite = false.obs;

  bool toggleFavorite() {
    isFavorite.value = !isFavorite.value;
    if (isFavorite.value) {
      Get.snackbar(
        'Favorite',
        'Added to favorites',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        'Favorite',
        'Removed from favorites',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
    }
    debugPrint('isFavorite: ${isFavorite.value}');
    return isFavorite.value;
  }
}
