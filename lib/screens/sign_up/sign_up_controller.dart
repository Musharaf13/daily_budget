import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../data/providers/signup_provider.dart';
import '../../routes/app_routes.dart';

class SignUpController extends GetxController {
  final SignupProvider provider = SignupProvider();
  final GlobalKey<FormState> emailPasswordFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> budgetFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController monthlyBudgetController = TextEditingController();
  final TextEditingController dailyBudgetController = TextEditingController();
  final TextEditingController workingDaysController = TextEditingController();
  final TextEditingController weekendsController = TextEditingController();
  late int userId;

  String receivedCode = "";

  bool _isSigningUp = false;
  bool get isSigningUp => _isSigningUp;
  set isSigningUp(value) {
    _isSigningUp = value;
    update();
  }

//0 showAll, 1 show only daily budget field, 2 show working and weekends field
  int _budgetFieldStatus = 0;
  int get budgetFieldStatus => _budgetFieldStatus;
  set budgetFieldStatus(value) {
    _budgetFieldStatus = value;
    update();
  }

  int _selectedStep = 0;
  int get selectedStep => _selectedStep;
  set selectedStep(value) {
    _selectedStep = value;
    update();
  }

  void generateOTP() {
    var random = Random();
    String randomNumber = (1000 + random.nextInt(9000)).toString();
    receivedCode = randomNumber;
    debugPrint("OTP: ${receivedCode}");
  }

  String? emailValidator(String? value) =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!)
          ? null
          : "invalid email address";

  String? passwordValidator(String? value) =>
      value!.length < 8 ? "password should be at least 8 characters" : null;

  String? confirmPasswordValidator(String? value) =>
      value! != passwordController.text ? "password does nt match" : null;

  FutureOr<String?> phoneNumberValidator(PhoneNumber? value) async =>
      value!.number.length < 13 ? "Invalid Phone number" : null;

  Future signup() async {
    isSigningUp = true;
    String phoneNumber = phoneNumberController.text.substring(1);
    var result = await provider.signup(
        email: emailController.text,
        password: passwordController.text,
        phoneNumber: phoneNumber);
    if (result["status"]) {
      userId = result["data"]["id"];
    }
    isSigningUp = false;
  }

  Future<void> addBudget() async {
    if (budgetFormKey.currentState!.validate()) {
      await signup();
      
      int dailyBudget = 0;
      int workingDaysBudget = 0;
      int weekendsBudget = 0;

      if (dailyBudgetController.text.isNotEmpty)
        dailyBudget = int.parse(dailyBudgetController.text);
      if (workingDaysController.text.isNotEmpty)
        workingDaysBudget = int.parse(workingDaysController.text);
      if (weekendsController.text.isNotEmpty)
        weekendsBudget = int.parse(weekendsController.text);


      provider.addBudget(
          monthlyBudget: int.parse(monthlyBudgetController.text),
          dailyBudget: dailyBudget,
          workingDaysBudget: workingDaysBudget,
          weekendsBudget: weekendsBudget,
          userId: userId);
    }
  }

  void validateForm() async {
    switch (selectedStep) {
      case 0:
        if (emailPasswordFormkey.currentState!.validate())
          selectedStep = selectedStep + 1;
        break;
      case 1:
        if (phoneFormKey.currentState!.validate()) {
          generateOTP();
          selectedStep = selectedStep + 1;
        }
        break;
      case 2:
        if (otpFormKey.currentState!.validate()) {
          selectedStep = selectedStep + 1;
        }
        break;
      default:
        await addBudget();
        Get.offAllNamed(Routes.navigationScreen);
        selectedStep = 0;
    }

    // if (validateEmailPass) {
    //   if (selectedStep < 3) {
    //     debugPrint("current step: ${selectedStep}");
    //     if (selectedStep == 1) {
    //       generateOTP();
    //       selectedStep = selectedStep + 1;
    //     } else if (selectedStep == 2 && otpController.text != receivedCode) {
    //     } else {
    //       selectedStep = selectedStep + 1;
    //     }
    //   } else {
    //     selectedStep = 0;
    //   }
    // }
  }
}
