import 'package:daily_budget/constants/typography.dart';
import 'package:daily_budget/global_widget/custom_button.dart';
import 'package:daily_budget/global_widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
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
          Container(
            child: CustomTextField(
              isEnable: true,
              controller: TextEditingController(),
              hintText: "Select Data Range",
              prefix: Icon(Icons.calendar_month),
              onTap: () {
                print("on tap");
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
                                  onSelectionChanged: (value) {},
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
                                    Get.back();
                                  })
                            ],
                          ),
                        ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
