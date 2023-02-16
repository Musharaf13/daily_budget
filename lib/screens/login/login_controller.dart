import 'package:daily_budget/data/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  final LoginProvider provider = LoginProvider();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isUserLogging = false;
  bool get isUserLogging => _isUserLogging;
  set isUserLogging(bool value) {
    _isUserLogging = value;
    update();
  }

  void onInit() {
    super.onInit();
    FlutterNativeSplash.remove();
  }

  void login() async {
    isUserLogging = true;
    var result = await provider.login(
        email: emailController.text, password: passwordController.text);
    if (result['status']) {
      int userId = int.parse(result['data'][0]["id"].toString());
      debugPrint("userId: ${userId}");
      box.write("userId", userId);
      Get.offAllNamed(Routes.navigationScreen);
    } else {
      showSnackBar(result['message']);
    }
    isUserLogging = false;
  }
}
