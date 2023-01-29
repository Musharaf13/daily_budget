import 'package:daily_budget/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../routes/app_routes.dart';

class Setting extends StatelessWidget {
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
              ListTile(
                onTap: () {},
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
