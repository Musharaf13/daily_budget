import 'package:daily_budget/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class AddOTP extends StatelessWidget {
  const AddOTP({
    Key? key,
    required this.validator,
    required this.formKey,
  }) : super(key: key);

  static final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: Color.fromRGBO(23, 171, 144, 1)),
    ),
  );

  final String? Function(String?)? validator;
  final Key formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 50),
          Text(
            "Just There",
            style: heading1TextStyle,
          ),
          SizedBox(
            height: 100,
          ),
          Pinput(
            focusNode: FocusNode(),
            androidSmsAutofillMethod:
                AndroidSmsAutofillMethod.smsUserConsentApi,
            listenForMultipleSmsOnAndroid: true,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            forceErrorState: false,
            defaultPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: const TextStyle(
                fontSize: 22,
                color: Color.fromRGBO(30, 60, 87, 1),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                border: Border.all(color: Color.fromRGBO(23, 171, 144, 0.4)),
              ),
            ),
            validator: validator,
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  width: 22,
                  height: 1,
                  color: Color.fromRGBO(243, 246, 249, 0),
                ),
              ],
            ),
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color.fromRGBO(23, 171, 144, 0.4)),
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(19),
                border: Border.all(color: Color.fromRGBO(23, 171, 144, 0.4)),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }
}
