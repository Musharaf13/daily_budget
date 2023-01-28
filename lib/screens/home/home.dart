import 'dart:math';

import 'package:daily_budget/constants/colors.dart';
import 'package:daily_budget/constants/typography.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan,
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                  ),
                ),
              ),
            ],
          ),
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

class MiniExpenditureTitle extends StatelessWidget {
  const MiniExpenditureTitle({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text("Rs. " + value)],
      ),
    );
  }
}
