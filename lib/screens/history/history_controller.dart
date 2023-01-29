import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HistoryController extends GetxController {
  TextEditingController dateRangeController = TextEditingController();
  List<String> _selectedCategories = [];
  List<String> get selectedCategories => _selectedCategories;

  set selectedCategories(value) {
    _selectedCategories = value;
    update();
  }
}
