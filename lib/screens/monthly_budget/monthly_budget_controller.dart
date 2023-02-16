// //
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:daily_budget/data/providers/monthly_budget_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/montthly_budget_details_model.dart';

class MonthlyBudgetController extends GetxController {
  final TextEditingController monthlyBudgetController = TextEditingController();
  final TextEditingController dailyBudgetController = TextEditingController();
  final TextEditingController workingDaysController = TextEditingController();
  final TextEditingController weekendsController = TextEditingController();
  final GlobalKey<FormState> budgetFormKey = GlobalKey<FormState>();

  final MonthlyBudgetProvider provider = MonthlyBudgetProvider();

  bool _isBudgetProcessing = false;
  bool get isBudgetProcessing => _isBudgetProcessing;
  set isBudgetProcessing(value) {
    _isBudgetProcessing = value;
    update();
  }

  void fetchMonthlyBudgetDetails() async {
    isBudgetProcessing = true;
    var result = await provider.fetchMonthlyBudgetDetails();

    if (result["status"]) {
      MonthlyBudgetDetailsModel budgetDetails =
          monthlyBudgetDetailsModelFromJson(result["data"][0]);
      weekendsController.text = budgetDetails.weekendsBudget;
      workingDaysController.text = budgetDetails.workingDayBudget;
      dailyBudgetController.text = budgetDetails.workingDayBudget;
      monthlyBudgetController.text = budgetDetails.monthlyBudget;
    }
    isBudgetProcessing = false;
  }

  void updateBudget() async {
    isBudgetProcessing = true;
    int dailyBudget = 0;
    int workingDaysBudget = 0;
    int weekendsBudget = 0;

    if (dailyBudgetController.text.isNotEmpty)
      dailyBudget = int.parse(dailyBudgetController.text);
    if (workingDaysController.text.isNotEmpty)
      workingDaysBudget = int.parse(workingDaysController.text);
    if (weekendsController.text.isNotEmpty)
      weekendsBudget = int.parse(weekendsController.text);

    await provider.updateBudget(
        monthlyBudget: int.parse(monthlyBudgetController.text),
        dailyBudget: dailyBudget,
        workingDaysBudget: workingDaysBudget,
        weekendsBudget: weekendsBudget,
        userId: 2);

    isBudgetProcessing = false;
  }
}
