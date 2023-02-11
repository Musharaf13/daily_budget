import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';

import '../../../constants/constants.dart';
import '../../../global_widget/custom_button.dart';
import '../../../global_widget/custom_drop_down.dart';
import '../../../global_widget/custom_text_field.dart';
import '../home_controller.dart';

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
      content: Form(
        key: controller.addExpenseFormKey,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: controller.amountController,
                hintText: "Expense Amount",
                validator: controller.expenseAmountValidator,
                allowDigitsOnly: true,
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
                validator: controller.expenseCategoryValidator,
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
              GetBuilder<HomeController>(
                  builder: (_) => Container(
                        child: controller.isAddingExpense
                            ? Center(child: CircularProgressIndicator())
                            : null,
                      )),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  title: "Add",
                  onTap: () {
                    controller.addExpense();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
