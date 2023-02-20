import 'dart:math';
import 'package:daily_budget/constants/colors.dart';
import 'package:daily_budget/constants/typography.dart';
import 'package:daily_budget/data/models/expense_analytics_model.dart';
import 'package:daily_budget/global_widget/custom_button.dart';
import 'package:daily_budget/screens/home/home_controller.dart';
import 'package:daily_budget/screens/home/widgets/add_expense_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import '../../global_widget/mini_expenditure_tile.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kWhite,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan,
          onPressed: () {
            showDialog(
                context: context,
                builder: (builder) {
                  // Add Expense Controller is also handled by same home controllers
                  return AddExpenseDialogue();
                });
          },
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: GetBuilder<HomeController>(
            // init: ,
            initState: ((state) {
              debugPrint("Init state  caled");
              controller.fetchExpenseAnalytics();
            }),
            builder: (_) {
              return controller.isExpenseAnalytricsBeingFetched
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.expenseAnalyticsList.isEmpty
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 200,
                              ),
                              Text(
                                "No Data Here",
                                style: heading1TextStyle,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                  title: "Add Expense",
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (builder) {
                                          // Add Expense Controller is also handled by same home controllers
                                          return AddExpenseDialogue();
                                        });
                                  })
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  "Today's Expenditure",
                                  style: heading1TextStyle,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Rs. ${controller.todaysExpense}",
                                  style: heading1TextStyle),
                              SizedBox(
                                height: 10,
                              ),
                              MiniExpenditureTitle(
                                  title: "Today's Limit",
                                  value: "${controller.getTodaysLimit()}"),
                              MiniExpenditureTitle(
                                  title: "This Months Expenditure",
                                  value: "${controller.thisMonthsExpense}"),
                              MiniExpenditureTitle(
                                  title: "This Month's Total Limit",
                                  value: "${controller.limits.monthlyBudget}"),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AspectRatio(
                                  aspectRatio: 1.3,
                                  child: BarChart(
                                    BarChartData(
                                      barGroups: _chartGroups(),
                                      borderData:
                                          FlBorderData(border: Border.all()),
                                      gridData: FlGridData(show: false),
                                      titlesData: FlTitlesData(
                                        bottomTitles: AxisTitles(
                                            sideTitles: _bottomTitles),
                                        leftTitles:
                                            AxisTitles(sideTitles: _leftTile),
                                        topTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false)),
                                        rightTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
            },
          )),
        ),
      ),
    );
  }
}

class PricePoint {
  final double x;
  final double y;

  PricePoint({required this.x, required this.y});
}

List<PricePoint> get pricePoints {
  final Random random = Random();
  // final randomNumbers = <double>[];
  final List<PricePoint> points = [];
  for (double i = 0; i <= 11; i++) {
    points.add(PricePoint(x: i, y: random.nextDouble()));
  }

  return points;
}

List<BarChartGroupData> _chartGroups() {
  final List<BarChartGroupData> points = [];
  final Random random = Random();
  final List<ExpenseAnalyticsModel> data =
      Get.find<HomeController>().expenseAnalyticsList;

  data.forEach((item) {
    points.add(BarChartGroupData(x: int.parse(item.date), barRods:
        // i == 22
        //     ? [BarChartRodData(toY: 400)]
        // :
        [BarChartRodData(toY: double.parse(item.amount))]));
  });

  // for (int i = data; i <= 30; i++) {
  //
  // }
  return points;
}

SideTitles get _bottomTitles => SideTitles(
      // reservedSize: 2.1,
      interval: 0.01,
      showTitles: true,
      getTitlesWidget: (value, meta) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            value.toInt() % 2 == 0 ? value.toInt().toString() : "",
            // style: TextStyle(fontSize: 12),
          ),
        );
      },
    );

SideTitles get _leftTile => SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        return Text(
          value.toInt().toString(),
        );
      },
    );
