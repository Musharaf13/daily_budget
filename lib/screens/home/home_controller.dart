import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/providers/home_provider.dart';

class HomeController extends GetxController {
  final HomeProvider provider = HomeProvider();
  //Add  Expense Dialogue
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int categorySelected = -1;

  void addExpense() {
    provider.addExpense(
        categoryId: categorySelected,
        amount: double.parse(amountController.text),
        description: descriptionController.text);
  }

  void clearFields() {
    amountController.clear();
    descriptionController.clear();
    categorySelected = -1;
  }
}
