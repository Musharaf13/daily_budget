import 'package:daily_budget/constants/colors.dart';
import 'package:daily_budget/constants/typography.dart';
import 'package:daily_budget/global_widget/custom_button.dart';
import 'package:daily_budget/global_widget/custom_text_field.dart';
import 'package:daily_budget/screens/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:im_stepper/stepper.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../global_widget/custom_otp.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  static final SignUpController controller = Get.find<SignUpController>();

  List<Widget> steps = [
    ConfirmEmailPassword(),
    EnterPhoneNumber(),
    Form(
      key: controller.otpFormKey,
      child: AddOTP(
          validator: (value) =>
              value != controller.receivedCode ? "Invalid" : null),
    ),
    WelcomeStep()
  ];

  // final List<Widget> steps = ;

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
                GetBuilder<SignUpController>(
                  builder: (_) => IconStepper(
                    enableStepTapping: false,
                    enableNextPreviousButtons: false,
                    activeStep: controller.selectedStep,
                    icons: [
                      Icon(Icons.app_registration_rounded),
                      Icon(Icons.phone),
                      Icon(Icons.pin),
                      Icon(Icons.done_outline_sharp),
                    ],
                    onStepReached: (value) {
                      controller.selectedStep = value;
                    },
                  ),
                ),
                GetBuilder<SignUpController>(
                  builder: (_) => SizedBox(
                    height: 400,
                    child: steps[controller.selectedStep],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GetBuilder<SignUpController>(
                  builder: (_) => controller.isSigningUp
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                    title: "Continue",
                    onTap: () {
                      controller.validateForm();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeStep extends StatelessWidget {
  const WelcomeStep({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          "Welcome Now You Are A Part Of Daily Budget",
          style: heading1TextStyle,
        ),
        SizedBox(
          height: 30,
        ),
        Image.asset("assets/images/savings.webp")
      ],
    );
  }
}

class EnterPhoneNumber extends GetView<SignUpController> {
  const EnterPhoneNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          "Almost There",
          style: heading1TextStyle,
        ),
        SizedBox(
          height: 80,
        ),
        Form(
          key: controller.phoneFormKey,
          child: IntlPhoneField(
            controller: controller.phoneNumberController,
            autovalidateMode: AutovalidateMode.disabled,
            validator: controller.phoneNumberValidator,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'PK',
            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}

class ConfirmEmailPassword extends GetView<SignUpController> {
  const ConfirmEmailPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.emailPasswordFormkey,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "On Boarding You",
            style: heading1TextStyle,
          ),
          SizedBox(
            height: 30,
          ),
          CustomTextField(
            controller: controller.emailController,
            hintText: "Enter Email",
            showHelperText: true,
            prefix: Icon(Icons.email),
            keyboardType: TextInputType.emailAddress,
            validator: controller.emailValidator,
          ),
          SizedBox(
            height: 30,
          ),
          CustomTextField(
            controller: controller.passwordController,
            hintText: "Enter Password",
            showHelperText: true,
            prefix: Icon(Icons.password),
            obscureText: true,
            validator: controller.passwordValidator,
          ),
          SizedBox(
            height: 30,
          ),
          CustomTextField(
            controller: controller.confirmPasswordController,
            hintText: "Confirm Password",
            showHelperText: true,
            prefix: Icon(Icons.confirmation_number),
            obscureText: true,
            validator: controller.confirmPasswordValidator,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
