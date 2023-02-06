import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

List<String> categories = ["Food", "Travel", "Grocery", "Shopping"];

void showSnackBar(String errorMessage, {int? duration}) {
  Get.snackbar(
    errorMessage,
    "",
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    duration: Duration(seconds: duration == null ? 10 : duration),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    backgroundColor: Colors.white,
  );
}
