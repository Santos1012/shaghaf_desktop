import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saghaf_desktop/core/media_query.dart';

enum CustomColor { white, black, lightGrey, darkGrey, yellow, orange }

Color getColor(CustomColor customColor) {
  switch (customColor) {
    case CustomColor.white:
      return Colors.white;
    case CustomColor.black:
      return const Color(0xFF383838);
    case CustomColor.lightGrey:
      return const Color(0xFF969696);
    case CustomColor.darkGrey:
      return const Color(0xFF5E5F60);
    case CustomColor.yellow:
      return const Color(0xFFFFCC0A);
    case CustomColor.orange:
      return const Color(0xFFF04C29);
    default:
      return Colors.black;
  }
}

class TextStyles {
/*
===>inter32white
   comfortaa => font family comfortaa
   32 => font size
   700 => font weight
*/

  static TextStyle comfortaa20_600(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 20.w(context),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle comfortaa16_400(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 16.w(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle comfortaa18_400(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 18.w(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle comfortaa14_400(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 14.w(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle comfortaa14_500(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 14.w(context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle comfortaa17_400(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 17.w(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle comfortaa10_400(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 10.w(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle comfortaa12_500(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 12.w(context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle comfortaa12_700(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 12.w(context),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle comfortaa20_700(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 20.w(context),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle comfortaa20_500(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 20.w(context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle comfortaa12_400(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 12.w(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle comfortaa12_600(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 12.w(context),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle comfortaa20_400(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 20.w(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle comfortaa13_500(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 13.w(context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle comfortaa9_400(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 9.w(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle comfortaa6_400(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 6.w(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle comfortaa24_600(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 24.w(context),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle comfortaa16_500(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 16.w(context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle comfortaa16_600(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 16.w(context),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle comfortaa16_700(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 16.w(context),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle comfortaa18_600(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 18.w(context),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle comfortaa15_500(
      BuildContext context, CustomColor customColor) {
    return GoogleFonts.comfortaa(
      color: getColor(customColor),
      fontSize: 15.w(context),
      fontWeight: FontWeight.w500,
    );
  }
}
