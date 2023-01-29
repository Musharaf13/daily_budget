import 'package:daily_budget/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        body: Center(
            child: IconStepper(
              enableNextPreviousButtons: false,
          icons: [
            Icon(Icons.app_registration_rounded),
            Icon(Icons.phone),
            Icon(Icons.pin),
            Icon(Icons.done_outline_sharp),
          ],
        )
            // Stepper(type: StepperType.horizontal, steps: [
            //   Step(
            //       // subtitle: Text("A"),
            //       title: Text("Emai"),
            //       // label: Text("B"),
            //       content: Column(
            //         children: [],
            //       )),
            //   Step(title: Text("Phone"), content: Column()),
            //   Step(title: Text("Confirm"), content: Column())
            // ]),
            ),
      ),
    );
  }
}
