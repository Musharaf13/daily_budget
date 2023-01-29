import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';
import '../constants/typography.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    required this.controller,
    required this.hintText,
    this.validator,
    this.style = bodyTextStyle,
    this.value = "",
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.height = 15,
    this.upperHintStyle = headlineSecondaryTextStyle,
    this.isEnable = false,
    this.onConfirmPress,
    this.isEditBox = false,
    this.onTap,
    this.prefix,
    this.onChanged,
    this.maxLines,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final String value;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final style;
  final double height;
  final TextStyle upperHintStyle;
  final bool isEditBox;
  bool isEnable;
  final Function()? onConfirmPress;
  final Function(String)? onChanged;
  final Widget? prefix;
  final int? maxLines;
  final void Function()? onTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    // implement initState
    _passwordVisible = widget.obscureText;

    super.initState();
  }

  var _passwordVisible;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      // enabled: widget.isEnable,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: _passwordVisible,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      // style: widget.style,
      readOnly: widget.isEnable,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        // prefixIconConstraints: BoxConstraints.loose(Size(30, 10)),
        prefixIcon: widget.prefix != null
            ? Padding(
                padding: const EdgeInsets.only(top: 0.0, left: 3),
                child: widget.prefix,
              )
            : null,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 8, vertical: widget.height),
        isDense: true,
        // isCollapsed: true,
        // label: Text(
        //   widget.hintText,
        //   style: widget.upperHintStyle,
        // ),
        border: OutlineInputBorder(borderSide: BorderSide(color: primary)),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: primary)),
        // suffixIconConstraints: BoxConstraints.loose(Size(20, 20)),
        suffixIcon: widget.obscureText
            ? IconButton(
                // constraints: BoxConstraints(maxHeight: 8),
                splashRadius: 16,
                padding: EdgeInsets.zero,
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    // widget.isEnable = !widget.isEnable;
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : widget.isEditBox
                ? IconButton(
                    // constraints: BoxConstraints(maxHeight: 8),
                    splashRadius: 15,
                    padding: EdgeInsets.only(right: 12, bottom: 8),
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      widget.isEnable ? Icons.edit : Icons.check,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        widget.isEnable = !widget.isEnable;
                      });
                      if (widget.onConfirmPress != null &&
                          widget.isEnable == true) widget.onConfirmPress!();
                    },
                  )
                : null,
      ),
    );
  }
}
