import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../constants/typography.dart';

class CustomDottedLineWithText extends StatelessWidget {
  const CustomDottedLineWithText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            lineLength: double.infinity,
            lineThickness: 4.0,
            dashLength: 4.0,
            dashColor: Colors.black,
            dashGradient: [Color.fromARGB(255, 31, 207, 210), Colors.blue],
            dashRadius: 0.0,
            dashGapLength: 4.0,
            dashGapColor: Colors.transparent,
            dashGapGradient: [Color.fromARGB(255, 0, 0, 0), Colors.blue],
            dashGapRadius: 0.0,
          ),
        ),
        Text(
          " $text ",
          style: heading1TextStyle,
        ),
        Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            lineLength: double.infinity,
            lineThickness: 4.0,
            dashLength: 4.0,
            dashColor: Colors.black,
            dashGradient: [Color.fromARGB(255, 31, 207, 210), Colors.blue],
            dashRadius: 0.0,
            dashGapLength: 4.0,
            dashGapColor: Colors.transparent,
            dashGapGradient: [Color.fromARGB(255, 0, 0, 0), Colors.blue],
            dashGapRadius: 0.0,
          ),
        ),
      ],
    );
  }
}