import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../constants/typography.dart';

class EnterPhoneNumber extends StatelessWidget {
  const EnterPhoneNumber({
    required this.formKey,
    required this.controller,
    required this.validation,
    Key? key,
  }) : super(key: key);

  final Key formKey;
  final FutureOr<String?> Function(PhoneNumber?)? validation;
  final TextEditingController controller;

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
        Form(
          key: formKey,
          child: IntlPhoneField(
            controller: controller,
            autovalidateMode: AutovalidateMode.disabled,
            validator: validation,
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
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
