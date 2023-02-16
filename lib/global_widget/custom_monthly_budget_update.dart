import 'package:flutter/material.dart';

import '../constants/typography.dart';
import 'custom_dotted_line_with_text.dart';
import 'custom_text_field.dart';

class BudgetConfiguration extends StatefulWidget {
  const BudgetConfiguration({
    super.key,
    required this.monthlyBudgetController,
    required this.dailyBudgetController,
    required this.workingDaysBudgetController,
    required this.weekendsBudgetController,
    required this.budgetFormKey,
  });

  final TextEditingController monthlyBudgetController;
  final TextEditingController dailyBudgetController;
  final TextEditingController workingDaysBudgetController;
  final TextEditingController weekendsBudgetController;
  final GlobalKey<FormState> budgetFormKey;

  @override
  State<BudgetConfiguration> createState() => _BudgetConfigurationState();
}

class _BudgetConfigurationState extends State<BudgetConfiguration> {
  int budgetFieldsStatus = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          "Configuring Your Budget",
          style: heading1TextStyle,
        ),
        SizedBox(
          height: 30,
        ),
        Form(
          key: widget.budgetFormKey,
          child: CustomTextField(
            controller: widget.monthlyBudgetController,
            hintText: "Enter Remaining Monthly Budget",
            allowDigitsOnly: true,
            validator: (value) =>
                value!.isEmpty ? "Please Enter Monthly budget" : null,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        CustomDottedLineWithText(
          text: "Below Optional",
        ),
        SizedBox(
          height: 30,
        ),
        if (budgetFieldsStatus == 1 || budgetFieldsStatus == 0)
          CustomTextField(
            controller: widget.dailyBudgetController,
            hintText: "Enter Daily Budget (Optional)",
            allowDigitsOnly: true,
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (value.length == 1) {
                  setState(() {
                    budgetFieldsStatus = 1;
                  });
                }
              } else {
                setState(() {
                  budgetFieldsStatus = 0;
                });
              }
            },
          ),
        if (budgetFieldsStatus == 1 || budgetFieldsStatus == 0)
          SizedBox(
            height: 20,
          ),
        if (budgetFieldsStatus == 0)
          CustomDottedLineWithText(
            text: "Or",
          ),
        if (budgetFieldsStatus == 1 || budgetFieldsStatus == 0)
          SizedBox(
            height: 20,
          ),
        if (budgetFieldsStatus == 2 || budgetFieldsStatus == 0)
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: widget.workingDaysBudgetController,
                  hintText: "Enter Working Days Budget (Optional)",
                  allowDigitsOnly: true,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      if (value.length == 1) {
                        setState(() {
                          budgetFieldsStatus = 2;
                        });
                      }
                    } else {
                      if (widget.weekendsBudgetController.text.isEmpty)
                        setState(() {
                          budgetFieldsStatus = 0;
                        });
                    }
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomTextField(
                  controller: widget.weekendsBudgetController,
                  hintText: "Enter Weekends Budget (Optional)",
                  allowDigitsOnly: true,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      if (value.length == 1) {
                        setState(() {
                          budgetFieldsStatus = 2;
                        });
                      }
                    } else {
                      if (widget.workingDaysBudgetController.text.isEmpty)
                        setState(() {
                          budgetFieldsStatus = 0;
                        });
                    }
                  },
                ),
              ),
            ],
          ),
      ],
    );
  }
}
