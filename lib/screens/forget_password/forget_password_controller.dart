import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl_phone_field/phone_number.dart';

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
}
