import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalSnackBar {
  static void showError(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }
}