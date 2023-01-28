import 'package:flutter/material.dart';

import 'colors.dart';

const String fontFamily = "Google Sans";

// Simple
const TextStyle headlineTextStyle = TextStyle(
  fontSize: 14,
  color: kBlack,
  fontWeight: FontWeight.w800,
  fontFamily: fontFamily,
);
const TextStyle heading1TextStyle = TextStyle(
  fontSize: 16,
  color: kBlack,
  fontWeight: FontWeight.w800,
  fontFamily: fontFamily,
);

const TextStyle headlineSecondaryTextStyle = TextStyle(
  letterSpacing: 1.1,
  fontSize: 10,
  color: kBlack,
  height: 1,
  fontFamily: fontFamily,
);

const TextStyle tableHeaderStyle = TextStyle(
  letterSpacing: 1.1,
  fontSize: 11,
  color: kBlack,
  height: 1,
  fontFamily: fontFamily,
  fontWeight: FontWeight.w800,
);

const TextStyle headline2TextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 11,
  color: kBlack,
);

const TextStyle bodyTextStyle =
    TextStyle(fontSize: 11, color: kBlack, fontFamily: fontFamily);

const TextStyle bodyTextStyleSecondary =
    TextStyle(fontSize: 10, color: kBlack, height: 1, fontFamily: fontFamily);

// TextStyle bodyLinkTextStyle = bodyTextStyle.copyWith(color: primary);

const TextStyle buttonTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: Colors.white,
    height: 1,
    fontFamily: fontFamily);

// Carousel
const TextStyle carouselBlueTextStyle = TextStyle(
  fontSize: 100,
  color: Color(0xFF008AFE),
  fontFamily: fontFamily,
  shadows: [
    Shadow(
      color: Color(0x40000000),
      offset: Offset(1, 1),
      blurRadius: 2,
    )
  ],
);

const TextStyle carouselWhiteTextStyle = TextStyle(
  fontSize: 100,
  color: Colors.white,
  fontFamily: fontFamily,
  shadows: [
    Shadow(
      color: Color(0x40000000),
      offset: Offset(1, 1),
      blurRadius: 2,
    )
  ],
);

const TextStyle receivedMessageTextStyle = TextStyle(
  color: cWhite,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

const TextStyle sentMessageTextStyle = TextStyle(
  color: cBlack,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

const TextStyle messageAvatarTextStyle = TextStyle(
    color: cWhite, fontSize: 16, fontWeight: FontWeight.w900, height: 1.5);

const TextStyle secondaryTitleTextStyle = TextStyle(
  color: cDarkBlue,
  fontSize: 16,
  fontWeight: FontWeight.w900,
  letterSpacing: 0.1,
);
// const TextStyle secondaryTitleTextStyle = TextStyle(
//   color: cDarkBlue,
//   fontSize: 16,
//   fontWeight: FontWeight.w900,
//   letterSpacing: 0.1,
// );
const TextStyle primaryTitleTextStyle = TextStyle(
  color: cDarkBlue,
  fontSize: 14,
  fontWeight: FontWeight.w800,
  letterSpacing: 0.1,
);
const TextStyle timeTextStyle = TextStyle(
  color: cBlue,
  fontSize: 12,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.1,
);

const TextStyle lightBodyText = TextStyle(
  color: cDarkGrey,
  fontWeight: FontWeight.w700,
  fontSize: 12,
);
const TextStyle normalBodyText = TextStyle(
  color: cLightBlue,
  fontWeight: FontWeight.w600,
  fontSize: 12.5,
);

const TextStyle dropDownTextStyle = TextStyle(
  color: cDarkBlue,
  fontSize: 12,
  fontWeight: FontWeight.w800,
);

const TextStyle dropDownSmallTextStyle = TextStyle(
  color: cDarkBlue,
  fontSize: 10,
);
const TextStyle simpleTextStyle = TextStyle(
  fontSize: 9,
  color: kBlack,
);

// P-request Tool tip data
const TextStyle tooltipSimpleStyle = TextStyle(
  fontSize: 12,
  color: kWhite,
);
const TextStyle tooltipBoldStyle = TextStyle(
  fontSize: 12,
  color: kWhite,
  fontWeight: FontWeight.w800,
);

const TextStyle hintStyle = TextStyle(
  fontSize: 8,
);
