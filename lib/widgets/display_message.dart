import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController showSnackBar(String title, String message) {
  return Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    backgroundColor: Colors.red,
  );
}
