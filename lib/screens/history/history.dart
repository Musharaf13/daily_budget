import 'package:chips_choice/chips_choice.dart';
import 'package:daily_budget/constants/constants.dart';
import 'package:daily_budget/constants/typography.dart';
import 'package:daily_budget/global_widget/custom_button.dart';
import 'package:daily_budget/global_widget/custom_text_field.dart';
import 'package:daily_budget/global_widget/mini_expenditure_tile.dart';
import 'package:daily_budget/screens/history/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../data/models/expense_history_model.dart';

class History extends GetView<HistoryController> {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "History",
              style: heading1TextStyle,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            isEnable: true,
            controller: controller.dateRangeController,
            hintText: "Select Dae Range",
            prefix: Icon(Icons.calendar_month),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (builder) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 400,
                              width: 500,
                              child: SfDateRangePicker(
                                controller: controller.dateController,
                                onSelectionChanged:
                                    (DateRangePickerSelectionChangedArgs
                                        value) {
                                  String startDate = DateFormat("yyyy-MM-dd")
                                      .format(value.value.startDate)
                                      .toString();
                                  String? endDate = null;
                                  if (value.value.endDate != null) {
                                    endDate = DateFormat("yyyy-MM-dd")
                                        .format(value.value.endDate)
                                        .toString();
                                  }
                                  controller.dateRangeController.text =
                                      "${startDate} ${endDate != null ? "to ${endDate}" : ""}";
                                  // controller.dateController. =
                                  //     value;
                                },
                                selectionMode:
                                    DateRangePickerSelectionMode.range,
                                initialSelectedRange: PickerDateRange(
                                    DateTime.now()
                                        .subtract(const Duration(days: 4)),
                                    DateTime.now()
                                        .add(const Duration(days: 3))),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                                title: "Okay",
                                onTap: () {
                                  controller.fetchExpenseHistory();
                                  Get.back();
                                })
                          ],
                        ),
                      ));
            },
          ),
          GetBuilder<HistoryController>(
            builder: (_) => ChipsChoice<String>.multiple(
              value: controller.selectedCategories,
              onChanged: (val) {
                controller.selectedCategories = val;
              },
              choiceItems: C2Choice.listFrom<String, String>(
                source: categories,
                value: (i, v) => v,
                label: (i, v) => v,
                tooltip: (i, v) => v,
              ),
              choiceCheckmark: true,
              choiceStyle: C2ChipStyle.outlined(),
            ),
          ),
          GetBuilder<HistoryController>(
            builder: (_) => MiniExpenditureTitle(
                title: "Total Expanse",
                value:
                    "${controller.expenseHistory.length > 0 ? controller.expenseHistory[0].amount : "0"}"),
          ),
          MiniExpenditureTitle(title: "Total Limit", value: "1000"),
          GetBuilder<HistoryController>(
            initState: (_) {
              controller.fetchExpenseHistory();
            },
            builder: (_) {
              return Flexible(
                child: controller.isExpenseHistoryBeingFetched
                    ? CircularProgressIndicator()
                    : controller.expenseHistory.length == 0
                        ? Center(
                            child: Text(
                              'Expense History Not Available',
                              style: headlineTextStyle,
                            ),
                          )
                        : ListView(
                            children: List.generate(
                            controller.expenseHistory.length,
                            (index) {
                              ExpenseHistoryModel expense =
                                  controller.expenseHistory[index];
                              debugPrint(
                                  "expense category: ${expense.categoryId}");
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: ListTile(
                                  leading: Image.asset(
                                      'assets/images/splash_screen.png'),
                                  title: Text("Rs ${expense.amount}"),
                                  trailing: Text(
                                      "${categories[expense.categoryId - 1]}"),
                                  subtitle: Text("${expense.description}"),
                                ),
                              );
                            },
                          )),
              );
            },
          ),
          SizedBox(
            height: 10,
          )
        ]));
  }
}
