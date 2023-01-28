import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.onTap,
    this.showLoading = false,
    this.color,
    this.notificationCount,
    // this.textStyle=headlineSecondaryTextStyle,
    Key? key,
  }) : super(key: key);

  final String title;
  final Color? color;
  final bool showLoading;
  final Function() onTap;
  final int? notificationCount;
  // final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: showLoading
          ? null
          : onTap, // To Disable button just pass null onPressed.
      disabledColor: secondary.withAlpha(600),
      color: color != null ? color : secondary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Text(
        title,
        // style: textStyle,
      ),
    );
  }
}
