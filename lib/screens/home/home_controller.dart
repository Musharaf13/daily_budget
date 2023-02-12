import 'package:daily_budget/data/models/expense_analytics_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/providers/home_provider.dart';

class HomeController extends GetxController {
  final HomeProvider provider = HomeProvider();
  //Add Expense Dialogue
  TextEditingController amountController = TextEditingController(text: "0");
  TextEditingController descriptionController = TextEditingController();
  int categorySelected = -1;
  final GlobalKey<FormState> addExpenseFormKey = GlobalKey<FormState>();
  DateTime addExpenseDate = DateTime.now();

  bool _isExpenseAnalytricsBeingFetched = false;
  bool get isExpenseAnalytricsBeingFetched => _isExpenseAnalytricsBeingFetched;
  set isExpenseAnalytricsBeingFetched(bool value) {
    _isExpenseAnalytricsBeingFetched = value;
    update();
  }

  List<ExpenseAnalyticsModel> expenseAnalyticsList = [];

  void addExpense() async {
    DateTime now = DateTime.now();
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    int daysPassed = now.difference(firstDayOfMonth).inDays + 1;
    print("Days passed in the current month: $daysPassed");
    debugPrint(
        "${DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now()) == DateFormat("yyyy-MM-dd HH:mm:ss").format(addExpenseDate)}");
    debugPrint("${DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now())}");
    debugPrint("${DateFormat("yyyy-MM-dd HH:mm:ss").format(addExpenseDate)}");
    // addExpenseDate == ;
    // debugPrint("${DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now())}");
    // debugPrint("${}");
    if (addExpenseFormKey.currentState!.validate()) {
      isAddingExpense = true;

      await provider.addExpense(
          categoryId: categorySelected,
          amount: double.parse(amountController.text),
          description: descriptionController.text,
          date: DateFormat("yyyy-MM-dd").format(DateTime.now()) ==
                  DateFormat("yyyy-MM-dd").format(addExpenseDate)
              ? "${DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now())}"
              : DateFormat("yyyy-MM-dd HH:mm:ss").format(addExpenseDate));
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
