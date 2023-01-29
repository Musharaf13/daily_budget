import 'package:daily_budget/constants/typography.dart';
import 'package:daily_budget/global_widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
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
          GestureDetector(
            onTap: () {
              print("on tap");
              showDialog(
                  context: context,
                  builder: (builder) => AlertDialog(
                        content: SfDateRangePicker(
                          onSelectionChanged: (value) {},
                          selectionMode: DateRangePickerSelectionMode.range,
                          initialSelectedRange: PickerDateRange(
                              DateTime.now().subtract(const Duration(days: 4)),
                              DateTime.now().add(const Duration(days: 3))),
                        ),
                      ));
            },
            child: CustomTextField(
              isEnable: true,
              controller: TextEditingController(),
              hintText: "Select Data Range",
              prefix: Icon(Icons.calendar_month),
            ),
          ),
        ],
      ),
    );
  }
}
