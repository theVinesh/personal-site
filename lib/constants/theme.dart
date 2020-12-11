import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thevinesh/constants/constants.dart';

class AppTheme {
  static const double baseFontSize = 18;

  static ThemeData get theme {
    final themeData = ThemeData.light();

    return themeData.copyWith(
      primaryColor: AppColors.red,
      primaryColorLight: AppColors.redLight,
      primaryColorDark: AppColors.redDark,
      accentColor: AppColors.grey,
      scaffoldBackgroundColor: AppColors.white,
      textTheme: GoogleFonts.oxygenMonoTextTheme(
        themeData.textTheme.apply(displayColor: AppColors.black),
      ),
      primaryTextTheme: GoogleFonts.oxygenMonoTextTheme(
        themeData.primaryTextTheme.apply(displayColor: AppColors.white),
      ),
    );
  }
}
