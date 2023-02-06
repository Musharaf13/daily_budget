import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl_phone_field/phone_number.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> emailPasswordFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  late String receivedCode;

  int _selectedStep = 0;
  int get selectedStep => _selectedStep;
  set selectedStep(value) {
    _selectedStep = value;
    update();
  }

  bool get validateEmailPass {
    switch (selectedStep) {
      case 0:
        return emailPasswordFormkey.currentState!.validate();
      case 1:
        return phoneFormKey.currentState!.validate();
      default:
        return true;
    }
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
}
