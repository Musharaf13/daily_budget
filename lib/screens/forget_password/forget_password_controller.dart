import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../constants/constants.dart';
import '../../data/providers/forget_password_provider.dart';
import '../../routes/app_routes.dart';

class ForgetPasswordController extends GetxController {
  final ForgetPasswordProvider provider = ForgetPasswordProvider();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  late String receivedCode;

  int _selectedStep = 0;
  int get selectedStep => _selectedStep;
  set selectedStep(value) {
    _selectedStep = value;
    update();
  }

  bool _isUpdatingPassword = false;
  bool get isUpdatingPassword => _isUpdatingPassword;
  set isUpdatingPassword(value) {
    _isUpdatingPassword = value;
    update();
  }

  void generateOTP() {
    var random = Random();
    String randomNumber = (1000 + random.nextInt(9000)).toString();
    receivedCode = randomNumber;
    debugPrint("OTP: ${receivedCode}");
  }

  FutureOr<String?> phoneNumberValidator(PhoneNumber? value) async =>
      value!.number.length < 13 ? "Invalid Phone number" : null;

  void validateForm() async {
    switch (selectedStep) {
      case 0:
        if (phoneFormKey.currentState!.validate()) {
          generateOTP();
          selectedStep = selectedStep + 1;
        }
        break;
      case 1:
        if (otpFormKey.currentState!.validate()) {
          selectedStep = selectedStep + 1;
        }
        break;
      case 2:
        if (newPasswordFormKey.currentState!.validate()) {
          // await signup();
          await updatePassword();
          selectedStep = selectedStep + 1;
        }
        break;
      default:
        Get.offAllNamed(Routes.navigationScreen);
        selectedStep = 0;
    }
  }

  String? passwordValidator(String? value) =>
      value!.length < 8 ? "password should be at least 8 characters" : null;

  String? confirmPasswordValidator(String? value) =>
      value! != passwordController.text ? "password does nt match" : null;

  Future updatePassword() async {
    isUpdatingPassword = true;
    String phoneNumber = "92" + phoneNumberController.text;
    var response = await provider.updatePassword(
        phoneNumber: phoneNumber, password: passwordController.text);
    if (response["status"]) {
      int userId = int.parse(response["data"][0]["id"].toString());
      debugPrint("userId received from update password: ${userId}");
      box.write("userId", userId);
    }
    isUpdatingPassword = false;
  }
}
