import 'package:flutter/material.dart';

class MiniExpenditureTitle extends StatelessWidget {
  const MiniExpenditureTitle({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text("Rs. " + value)],
      ),
    );
  }
}
