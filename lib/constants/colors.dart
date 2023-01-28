import 'package:flutter/material.dart';

//CSR Module Color Coding
const Color cWhite = Colors.white;
const Color cGrey = Color.fromARGB(255, 217, 231, 233);
const Color cDarkGrey = Color.fromARGB(250, 167, 165, 165);
const Color cSilver = Color.fromARGB(169, 221, 232, 234);
const Color cLightBlue = Color.fromARGB(252, 92, 174, 199);
const Color cBlue = Color.fromARGB(251, 70, 145, 230);
const Color cBlack = Color.fromARGB(251, 0, 0, 0);
const Color cDarkBlue = Color.fromARGB(249, 18, 8, 111);
const Color cMediumBlue = Color.fromARGB(184, 32, 22, 126);
const Color cGreen = Color.fromARGB(184, 11, 168, 63);
const Color cOrange = Color.fromARGB(184, 255, 176, 50);
const Color cRed = Color.fromARGB(184, 236, 28, 0);

// Rest of the App Default color pallet (change colors but structure should be maintained.)
const Color primary = Color(0xff008AA3);
const Color primaryLight = Color(0xffDFFBFF);
const Color secondary = Color(0xff1DB9FE);
const Color tertiary = Color(0xffF2F2F2);
const Color lightBlue = Color(0xffE3EFFF);
const Color kLinkColor = Color.fromARGB(255, 4, 134, 214);

const Color textPrimary = Color(0xff008AA3);
const Color textSecondary = Color(0xffFFFFFF);
const Color textGrey = Color(0xff828282);
const Color textLightGrey = Color(0xffBDBDBD);
const Color textDarkGrey = Color(0xff4F4F4F);
const Color textLightBlack = Color(0xff3D3D3D);

const Color buttonPrimary = Color(0xff008AA3);
const Color buttonPrimaryPressed = Color(0xff02778c);
const Color buttonPrimaryPressedOutline = Color(0xff04bddd);
const Color kFocusedBorderColor = Colors.lightBlueAccent;
final Color kBadgeColor = Colors.orangeAccent.shade400.withOpacity(0.7);

final Color background = Color(0xffF8FBFF);
const Color backgroundDark = Color(0xFF303c42);
const Color splashGifBackground = Color(0xffF1F4FB);
// borders
const Color border = Color(0x20000000);
const Color kBoderColorLight = Color(0xffE0E0E0);
const Color kBorderColor = Color(0xffBDBDBD);
// divider color
const Color kBorderColorDark = Colors.grey;

// Don't add any other color untill not found in above pallete
// Follow above structure
// Add any other colors bellow only if needed globally & are reusable

//Icon & extra colors
// DarkBlue is mostly used with Icons Outline and some fonts as secondary
const Color kDarkBlue = Color(0xff1E226B);
const Color kLinksColor = Color(0xff0000EE);
const Color kBlack = Colors.black;
const Color kWhite = Colors.white;
const Color kGray1 = Color(0xff333333);
const Color kGreen = Color(0xff27AE60);
// cards color section
Color kStarColor = Color(0xffF9C900).withOpacity(0.7);
Color kHeartColor = Colors.red;
const Color kPinkColor = Color.fromARGB(255, 246, 146, 223);

// check mark color
const Color checkmarkColor = Color(0xff6FCF97);

//Categories Color

List<Color> categoriesColor = [
  Colors.lightBlue.withOpacity(0.6),
  kGreen,
  Colors.redAccent.withOpacity(0.6),
  Color.fromARGB(255, 184, 130, 50).withOpacity(0.6)
];
//Order Delivery Status Color Coding;

Map<int, Color> orderDeliveryDropDownColorCoding = {
  -1: kWhite,
  0: Colors.yellow.withOpacity(0.6),
  1: Colors.lightBlue.withOpacity(0.6),
  2: Colors.red[200]!.withOpacity(0.6),
  3: Colors.redAccent.withOpacity(0.6),
  4: Colors.purple[300]!.withOpacity(0.6),
  5: Colors.orange[300]!.withOpacity(0.6),
  6: Color.fromARGB(255, 184, 130, 50).withOpacity(0.6),
  7: Color.fromARGB(255, 93, 126, 223).withOpacity(0.6),
  8: Color.fromARGB(255, 233, 128, 71).withOpacity(0.6),
  9: Color.fromARGB(255, 230, 196, 146).withOpacity(0.6),
  10: Color.fromARGB(255, 61, 41, 243).withOpacity(0.6)
};
