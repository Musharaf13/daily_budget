import 'dart:math';

import 'package:daily_budget/constants/colors.dart';
import 'package:daily_budget/constants/constants.dart';
import 'package:daily_budget/constants/typography.dart';
import 'package:daily_budget/global_widget/custom_button.dart';
import 'package:daily_budget/global_widget/custom_drop_down.dart';
import 'package:daily_budget/global_widget/custom_text_field.dart';
import 'package:daily_budget/screens/home/home_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

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
          child: SingleChildScrollView(
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
                Text("Rs. 100", style: heading1TextStyle),
                SizedBox(
                  height: 10,
                ),
                MiniExpenditureTitle(title: "Today's Limit", value: "200"),
                MiniExpenditureTitle(
                    title: "This Months Expenditure", value: "23000"),
                MiniExpenditureTitle(
                    title: "This Month's Total Limit", value: "25000"),
                SizedBox(
                  height: 30,
                ),
                AspectRatio(
                  aspectRatio: 1.3,
                  child: BarChart(
                    BarChartData(
                      barGroups: _chartGroups(),
                      borderData: FlBorderData(border: Border.all()),
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                        leftTitles: AxisTitles(sideTitles: _leftTile),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddExpenseDialogue extends GetView<HomeController> {
  const AddExpenseDialogue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text("Add Expenditure"),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: controller.amountController,
            hintText: "Expense Amount",
          ),
          SizedBox(
            height: 20,
          ),
          CustomDropDown(
            hintText: "Select Category",
            currentValue: controller.categorySelected,
            onChanged: (value) {
              controller.categorySelected = value!;
            },
            items: List.generate(
                3,
                (index) => DropdownMenuItem(
                      child: Text(categories[index]),
                      value: index,
                    )),
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: controller.descriptionController,
            hintText: "Optional Description",
            maxLines: 4,
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
              title: "Add",
              onTap: () {
                Get.back();
              })
        ],
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

  for (int i = 1; i <= 30; i++) {
    points.add(BarChartGroupData(
        x: i, barRods: [BarChartRodData(toY: random.nextDouble() * 100)]));
  }
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
