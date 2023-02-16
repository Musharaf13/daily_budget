import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';

const String kbaseUrl = "https://daily-budget-backend.vercel.app";

List<String> categories = ["Food", "Travel", "Grocery", "Shopping", "Other"];
final GetStorage box = GetStorage();

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
