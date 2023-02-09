import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../routes/app_routes.dart';

class ForgetPasswordController extends GetxController {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  late String receivedCode;

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
          // await signup();
          selectedStep = selectedStep + 1;
        }
        break;
      default:
        Get.offAllNamed(Routes.navigationScreen);
        selectedStep = 0;
    }
  }
}
