import 'package:daily_budget/constants/typography.dart';
import 'package:daily_budget/screens/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';

import '../../global_widget/custom_monthly_budget_update.dart';
import '../../routes/app_routes.dart';

class Setting extends GetView<SettingsController> {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Center(child: Text("Settings", style: heading1TextStyle)),
        SizedBox(
          height: 20,
        ),
        Flexible(
          child: ListView(
            children: [
              // ExpansionTile(
              //   title: Text("Update Monthhly Budget"),
              //   leading: Icon(Icons.update),
              //   children: [
              //     BudgetConfiguration(
              //       monthlyBudgetController: controller.monthlyBudgetController,
              //       dailyBudgetController: controller.dailyBudgetController,
              //       workingDaysBudgetController:
              //           controller.workingDaysController,
              //       weekendsBudgetController: controller.weekendsController,
              //       budgetFormKey: controller.budgetFormKey,
              //     ),
              //   ],
              // ),
              ListTile(
                onTap: () {
                  Get.toNamed(Routes.monthlyBudgetScreen);
                },
                leading: Icon(Icons.settings),
                title: Text("Edit Limit and Budget"),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text("Privacy Policy"),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.contact_mail_outlined),
                title: Text("Contact Us"),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.question_mark_sharp),
                title: Text("FAQs"),
              ),
            ],
          ),
        ),
        Expanded(child: Container()),
        ListTile(
          onTap: () {
            Get.offAllNamed(Routes.loginScreen);
          },
          leading: Icon(Icons.logout),
          title: Text("Logout"),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
