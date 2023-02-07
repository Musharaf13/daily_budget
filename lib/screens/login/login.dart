import 'package:daily_budget/global_widget/custom_button.dart';
import 'package:daily_budget/global_widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';

import '../../routes/app_routes.dart';
import 'login_controller.dart';

class Login extends GetView<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                ),
                Image.asset(
                  "assets/images/splash_screen.png",
                  height: 200,
                  width: 200,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: controller.emailController,
                  hintText: "Email",
                  prefix: Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: controller.passwordController,
                  hintText: "Password",
                  prefix: Icon(Icons.password_outlined),
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                GetBuilder<LoginController>(
                    builder: (_) => controller.isUserLogging
                        ? Column(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 20),
                            ],
                          )
                        : Container()),
                CustomButton(
                    title: "Login",
                    onTap: () {
                      controller.login();
                    }),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.forgetPasswordScreen);
                    },
                    child: Text("Forget Password?")),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New here?"),
                    TextButton(
                        onPressed: () {
                          // controller.login();
                          Get.toNamed(Routes.signUpScreen);
                        },
                        child: Text("Sign up")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
