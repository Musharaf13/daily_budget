import 'package:daily_budget/constants/colors.dart';
import 'package:daily_budget/constants/typography.dart';
import 'package:daily_budget/global_widget/custom_button.dart';
import 'package:daily_budget/global_widget/custom_text_field.dart';
import 'package:daily_budget/screens/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:im_stepper/stepper.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

import '../../routes/app_routes.dart';

class SignUp extends GetView<SignUpController> {
  SignUp({super.key});
  static final pinController = TextEditingController();
  static final focusNode = FocusNode();
  // final formKey = GlobalKey<FormState>();

  static final focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
  static final fillColor = Color.fromRGBO(243, 246, 249, 0);
  static final borderColor = Color.fromRGBO(23, 171, 144, 0.4);

  static final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: borderColor),
    ),
  );

  final List<Widget> steps = [
    ConfirmEmailPassword(),
    EnterPhoneNumber(),
    AddOTP(
        pinController: pinController,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        focusedBorderColor: focusedBorderColor,
        fillColor: fillColor),
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
                CustomButton(
                    title: "Continue",
                    onTap: () {
                      if (controller.selectedStep < 3) {
                        controller.selectedStep = controller.selectedStep + 1;
                      } else {
                        Get.offAllNamed(Routes.navigationScreen);
                        controller.selectedStep = 0;
                      }
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

class AddOTP extends StatelessWidget {
  const AddOTP({
    Key? key,
    required this.pinController,
    required this.focusNode,
    required this.defaultPinTheme,
    required this.focusedBorderColor,
    required this.fillColor,
  }) : super(key: key);

  final TextEditingController pinController;
  final FocusNode focusNode;
  final PinTheme defaultPinTheme;
  final Color focusedBorderColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Text(
          "Just There",
          style: heading1TextStyle,
        ),
        SizedBox(
          height: 100,
        ),
        Pinput(
          controller: pinController,
          focusNode: focusNode,
          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
          listenForMultipleSmsOnAndroid: true,
          defaultPinTheme: defaultPinTheme,
          validator: (value) {
            return value == '2222' ? null : 'Pin is incorrect';
          },
          onClipboardFound: (value) {
            debugPrint('onClipboardFound: $value');
            pinController.setText(value);
          },
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          onCompleted: (pin) {
            debugPrint('onCompleted: $pin');
          },
          onChanged: (value) {
            debugPrint('onChanged: $value');
          },
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 9),
                width: 22,
                height: 1,
                color: focusedBorderColor,
              ),
            ],
          ),
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: focusedBorderColor),
            ),
          ),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: fillColor,
              borderRadius: BorderRadius.circular(19),
              border: Border.all(color: focusedBorderColor),
            ),
          ),
          errorPinTheme: defaultPinTheme.copyBorderWith(
            border: Border.all(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }
}

class EnterPhoneNumber extends StatelessWidget {
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
        IntlPhoneField(
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
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}

class ConfirmEmailPassword extends StatelessWidget {
  const ConfirmEmailPassword({
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
          "On Boarding You",
          style: heading1TextStyle,
        ),
        SizedBox(
          height: 30,
        ),
        CustomTextField(
          controller: TextEditingController(),
          hintText: "Enter Email",
          showHelperText: true,
          prefix: Icon(Icons.email),
        ),
        SizedBox(
          height: 30,
        ),
        CustomTextField(
          controller: TextEditingController(),
          hintText: "Enter Password",
          showHelperText: true,
          prefix: Icon(Icons.password),
          obscureText: true,
        ),
        SizedBox(
          height: 30,
        ),
        CustomTextField(
          controller: TextEditingController(),
          hintText: "Confirm Password",
          showHelperText: true,
          prefix: Icon(Icons.confirmation_number),
          obscureText: true,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
