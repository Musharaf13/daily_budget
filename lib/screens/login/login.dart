import 'package:daily_budget/global_widget/custom_button.dart';
import 'package:daily_budget/global_widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
                  controller: new TextEditingController(),
                  hintText: "Email",
                  prefix: Icon(Icons.email),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: new TextEditingController(),
                  hintText: "Password",
                  prefix: Icon(Icons.password_outlined),
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(title: "Login", onTap: () {}),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New here?"),
                    TextButton(onPressed: () {}, child: Text("Sign up")),
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
