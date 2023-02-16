import 'package:daily_budget/global_widget/custom_button.dart';
import 'package:daily_budget/screens/monthly_budget/monthly_budget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../global_widget/custom_monthly_budget_update.dart';

class MonthlyBudget extends GetView<MonthlyBudgetController> {
  const MonthlyBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(14.0),
            child: GetBuilder<MonthlyBudgetController>(
              initState: (_) {
                controller.fetchMonthlyBudgetDetails();
              },
              builder: (_) {
                return controller.isBudgetProcessing
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          BudgetConfiguration(
                            monthlyBudgetController:
                                controller.monthlyBudgetController,
                            dailyBudgetController:
                                controller.dailyBudgetController,
                            workingDaysBudgetController:
                                controller.workingDaysController,
                            weekendsBudgetController:
                                controller.weekendsController,
                            budgetFormKey: controller.budgetFormKey,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          CustomButton(
                              title: "Update",
                              onTap: () {
                                controller.updateBudget();
                              }),
                        ],
                      );
              },
            )),
      ),
    );
  }
}
