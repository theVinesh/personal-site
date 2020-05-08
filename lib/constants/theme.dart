import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SiteTheme {
  static const Color black = Color(0xff000000);

  static const Color white = Color(0xffffffff);

  static const Color red = Color(0xffd50000);

  static const Color redLight = Color(0xffff5131);

  static const Color redDark = Color(0xff9b0000);

  static const Color grey = Color(0xfffafafa);

  static const double baseFontSize = 18;

  static ThemeData get theme {
    final themeData = ThemeData.light();

    return themeData.copyWith(
      primaryColor: red,
      primaryColorLight: redLight,
      primaryColorDark: redDark,
      accentColor: grey,
      scaffoldBackgroundColor: white,
      textTheme: GoogleFonts.oxygenMonoTextTheme(
        themeData.textTheme.apply(displayColor: black),
      ),
      primaryTextTheme: GoogleFonts.oxygenMonoTextTheme(
        themeData.primaryTextTheme.apply(displayColor: white),
      ),
    );
  }
}
