import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    Key? key,
    this.hintText = "",
    required this.onChanged,
    this.currentValue,
    this.colorType = "NORMAL",
    this.items,
    this.colorCoding,
    this.clearDropDown,
    this.height = 4,
    this.isEnable = true,
    this.hintStyle = const TextStyle(
      fontSize: 8,
    ),
    this.validator = null,
    this.isValid = true,
  }) {
    this.currentValue = currentValue == -1 ? null : currentValue;
  }

  final String hintText;
  final void Function(int? value)? onChanged;
  int? currentValue;
  final String colorType;
  final List<DropdownMenuItem<int>>? items;
  final Map<int, Color>? colorCoding;
  final void Function()? clearDropDown;
  final String? Function(int?)? validator;
  final double height;
  final TextStyle hintStyle;
  final isEnable;
  final bool isValid;
  Widget build(BuildContext context) {
    return Container(
      // height: 25,
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: colorCoding == null
          ? BoxDecoration(
              color: colorType == "NORMAL"
                  ? kWhite
                  : currentValue == 2
                      ? primary.withOpacity(0.6)
                      : currentValue == 1
                          ? Colors.yellow.withOpacity(0.6)
                          : Colors.redAccent.withOpacity(0.6),
              border: isValid
                  ? Border.all(
                      color: colorType == "NORMAL"
                          ? primary
                          : currentValue == 2
                              ? primary.withOpacity(0.6)
                              : currentValue == 1
                                  ? Colors.yellow.withOpacity(0.9)
                                  : Colors.redAccent.withOpacity(0.6))
                  : Border.all(color: kHeartColor),
              borderRadius: BorderRadius.circular(4),
            )
          : BoxDecoration(
              color: colorCoding![currentValue ?? -1]!,
              border: Border.all(
                color: currentValue == null
                    ? primary
                    : colorCoding![currentValue]!.withOpacity(0.9),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
      child: DropdownButtonFormField<int>(
          // menuMaxHeight: 40
          validator: validator,
          decoration: InputDecoration(
              enabled: isEnable,
              // labelText: "Select Area",
              // counterText: "Select Area",
              // counter: Text("Select Area"),
              // helperText: "Select Area",
              // labelStyle: ,
              // labelText: "Select Area",
              // hintText: "Select Area",
              // counterText: "",
              // label: Padding(
              //   padding: const EdgeInsets.only(bottom: 10),
              //   child: Text("Select Area", style: TextStyle(fontSize: 10)),
              // ),
              isDense: true,
              isCollapsed: true,
              contentPadding: EdgeInsets.symmetric(vertical: height)),
          isExpanded: true,
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (currentValue != null && clearDropDown != null)
                GestureDetector(
                  onTap: clearDropDown,
                  child: Icon(
                    Icons.clear,
                    size: 15,
                    color: kGray1.withOpacity(0.8),
                  ),
                ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: kGray1,
                size: 20,
              ),
            ],
          ),
          hint: Text(
            hintText,
            // style: hintStyle,
          ),
          // style: TextStyle(
          //   color: kBlack,
          //   fontSize: 11,
          // ),
          elevation: 16,
          isDense: true,
          onChanged: onChanged,
          value: currentValue == -1 ? null : currentValue,
          items: items),
    );
  }
}
