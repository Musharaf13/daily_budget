import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

List<String> categories = ["Food", "Travel", "Grocery", "Shopping", "Other"];

Map<String, int> allCategoryIds = {
  "Food": 1,
  "Travel": 2,
  "Grocery": 3,
  "Shopping": 4,
  "Other": 5
};

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
