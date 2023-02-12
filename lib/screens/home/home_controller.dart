import 'package:daily_budget/data/models/expense_analytics_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/providers/home_provider.dart';

class HomeController extends GetxController {
  final HomeProvider provider = HomeProvider();
  //Add  Expense Dialogue
  TextEditingController amountController = TextEditingController(text: "0");
  TextEditingController descriptionController = TextEditingController();
  int categorySelected = -1;
  final GlobalKey<FormState> addExpenseFormKey = GlobalKey<FormState>();

  bool _isExpenseAnalytricsBeingFetched = false;
  bool get isExpenseAnalytricsBeingFetched => _isExpenseAnalytricsBeingFetched;
  set isExpenseAnalytricsBeingFetched(bool value) {
    _isExpenseAnalytricsBeingFetched = value;
    update();
  }

  List<ExpenseAnalyticsModel> expenseAnalyticsList = [];

  void addExpense() async {
    if (addExpenseFormKey.currentState!.validate()) {
      isAddingExpense = true;
      await provider.addExpense(
          categoryId: categorySelected,
          amount: double.parse(amountController.text),
          description: descriptionController.text);
      Get.back();
      clearFields();
      isAddingExpense = false;
      fetchExpenseAnalytics();
    }
  }

  void fetchExpenseAnalytics() async {
    isExpenseAnalytricsBeingFetched = true;
    expenseAnalyticsList = await provider.fetchExpenseAnalytics();
    isExpenseAnalytricsBeingFetched = false;
  }

  bool _isAddingExpense = false;
  bool get isAddingExpense => _isAddingExpense;
  set isAddingExpense(bool value) {
    _isAddingExpense = value;
    update();
  }

  void clearFields() {
    amountController.clear();
    descriptionController.clear();
    categorySelected = -1;
  }

  String? expenseAmountValidator(String? value) {
    if (value!.isEmpty || double.parse(value) <= 0)
      return "Amount should be greater then zero";
    else
      return null;
  }

  String? expenseCategoryValidator(int? value) {
    if (categorySelected == -1)
      return "Category should be selected";
    else
      return null;
  }
}
