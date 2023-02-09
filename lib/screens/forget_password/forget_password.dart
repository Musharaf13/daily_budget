import 'package:daily_budget/screens/forget_password/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:im_stepper/stepper.dart';

import '../../constants/colors.dart';
import '../../global_widget/custom_button.dart';
import '../../global_widget/custom_otp.dart';
import '../../global_widget/phone_text_field.dart';
import '../sign_up/sign_up.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  // static final focusNode = FocusNode();
  // // final formKey = GlobalKey<FormState>();

  static ForgetPasswordController controller =
      Get.find<ForgetPasswordController>();

  // static final focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
  // static final fillColor = Color.fromRGBO(243, 246, 249, 0);
  // static final borderColor = Color.fromRGBO(23, 171, 144, 0.4);

  // static final defaultPinTheme = PinTheme(
  //   width: 56,
  //   height: 56,
  //   textStyle: const TextStyle(
  //     fontSize: 22,
  //     color: Color.fromRGBO(30, 60, 87, 1),
  //   ),
  //   decoration: BoxDecoration(
  //     borderRadius: BorderRadius.circular(19),
  //     border: Border.all(color: borderColor),
  //   ),
  // );

  final List<Widget> steps = [
    EnterPhoneNumber(
      formKey: controller.phoneFormKey,
      controller: controller.phoneNumberController,
      validation: controller.phoneNumberValidator,
    ),
    AddOTP(
        formKey: controller.otpFormKey,
        validator: (value) =>
            value != controller.receivedCode ? "Invalid" : null),
    WelcomeStep()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                GetBuilder<ForgetPasswordController>(
                  builder: (_) => IconStepper(
                    enableStepTapping: false,
                    enableNextPreviousButtons: false,
                    activeStep: controller.selectedStep,
                    icons: [
                      Icon(Icons.phone),
                      Icon(Icons.pin),
                      Icon(Icons.done_outline_sharp),
                    ],
                    onStepReached: (value) {
                      controller.selectedStep = value;
                    },
                  ),
                ),
                GetBuilder<ForgetPasswordController>(
                  builder: (_) => SizedBox(
                    height: 400,
                    child: steps[controller.selectedStep],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButton(
                    title: "Continue",
                    onTap: () {
                      controller.validateForm();
                      // if (controller.selectedStep < 3) {
                      //   debugPrint("current step: ${controller.selectedStep}");
                      //   if (controller.selectedStep == 1) {
                      //     controller.generateOTP();
                      //     controller.selectedStep = controller.selectedStep + 1;
                      //   } else if (controller.selectedStep == 2 &&
                      //       controller.otpController.text !=
                      //           controller.receivedCode) {
                      //   } else {
                      //     controller.selectedStep = controller.selectedStep + 1;
                      //   }
                      //   //  else {
                      //   //   Get.offAllNamed(Routes.navigationScreen);
                      //   //   controller.selectedStep = 0;
                      //   // }
                      // }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
