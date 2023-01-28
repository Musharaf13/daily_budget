import 'package:daily_budget/global_widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
