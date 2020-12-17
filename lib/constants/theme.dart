import 'package:flutter/material.dart';
import 'package:thevinesh/constants/colors.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/utils/utils.dart';

class AppTheme {
  static const double DEFAULT_FONT_SIZE = 14.0;

  static ThemeData theme(
      {@required BuildContext using, bool isDarkMode = false}) {
    assert(using != null);
    final _darkColorScheme = ColorScheme(
      primary: AppColors.fireEngine,
      primaryVariant: AppColors.brick,
      onPrimary: AppColors.white,
      secondary: AppColors.nero,
      secondaryVariant: AppColors.black,
      onSecondary: AppColors.white,
      surface: AppColors.black,
      onSurface: AppColors.white,
      background: AppColors.black,
      onBackground: AppColors.white,
      error: AppColors.brick,
      onError: AppColors.white,
      brightness: Brightness.dark,
    );

    final _lightColorScheme = ColorScheme(
      primary: AppColors.fireEngine,
      primaryVariant: AppColors.brick,
      onPrimary: AppColors.white,
      secondary: AppColors.nero,
      secondaryVariant: AppColors.black,
      onSecondary: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.black,
      background: AppColors.white,
      onBackground: AppColors.black,
      error: AppColors.brick,
      onError: AppColors.white,
      brightness: Brightness.light,
    );

    final colorScheme = isDarkMode ? _darkColorScheme : _lightColorScheme;

    ///Copied from #ThemeData.from(colorScheme)
    // For surfaces that use primary color in light themes and surface color in dark
    final Color primarySurfaceColor =
        isDarkMode ? colorScheme.surface : colorScheme.primary;
    final Color onPrimarySurfaceColor =
        isDarkMode ? colorScheme.onSurface : colorScheme.onPrimary;

    final _themeData = ThemeData(
      brightness: colorScheme.brightness,
      primaryColor: primarySurfaceColor,
      primaryColorBrightness:
          ThemeData.estimateBrightnessForColor(primarySurfaceColor),
      canvasColor: colorScheme.background,
      accentColor: colorScheme.secondary,
      accentColorBrightness:
          ThemeData.estimateBrightnessForColor(colorScheme.secondary),
      scaffoldBackgroundColor: colorScheme.background,
      bottomAppBarColor: colorScheme.surface,
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      backgroundColor: colorScheme.background,
      dialogBackgroundColor: colorScheme.background,
      errorColor: colorScheme.error,
      indicatorColor: onPrimarySurfaceColor,
      applyElevationOverlayColor: isDarkMode,
      colorScheme: colorScheme,
      fontFamily: Fonts.OXYGEN_MONO_REGULAR_FAMILY,
    );

    ///_________________

    /// Extremely large text.
    final TextStyle headline1 = _themeData.textTheme.headline1;

    /// Very, very large text.
    ///
    /// Used for the date in the dialog shown by [showDatePicker].
    final TextStyle headline2 = _themeData.textTheme.headline2;

    /// Very large text.
    final TextStyle headline3 = _themeData.textTheme.headline3;

    /// Large text.
    final TextStyle headline4 = _themeData.textTheme.headline4;

    /// Used for large text in dialogs (e.g., the month and year in the dialog
    /// shown by [showDatePicker]).
    final TextStyle headline5 = _themeData.textTheme.headline5;

    /// Used for the primary text in app bars and dialogs (e.g., [AppBar.title]
    /// and [AlertDialog.title]).
    final TextStyle headline6 = _themeData.textTheme.headline6;

    /// Used for the primary text in lists (e.g., [ListTile.title]).
    final TextStyle subtitle1 = _themeData.textTheme.subtitle1;

    /// For medium emphasis text that's a little smaller than [subtitle1].
    final TextStyle subtitle2 = _themeData.textTheme.subtitle2;

    /// Used for emphasizing text that would otherwise be [bodyText2].
    final TextStyle bodyText1 = _themeData.textTheme.bodyText1;

    /// The default text style for [Material].
    final TextStyle bodyText2 = _themeData.textTheme.bodyText2;

    /// Used for auxiliary text associated with images.
    final TextStyle caption = _themeData.textTheme.caption;

    /// Used for text on [ElevatedButton], [TextButton] and [OutlinedButton].
    final TextStyle button = _themeData.textTheme.button;

    /// The smallest style.
    ///
    /// Typically used for captions or to introduce a (larger) headline.
    final TextStyle overline = _themeData.textTheme.overline;

    final textTheme = _themeData.textTheme.copyWith(
      headline1: headline1.copyWith(
          fontSize: (DEFAULT_FONT_SIZE + 80).sp(using: using)),
      headline2: headline2.copyWith(
          fontSize: (DEFAULT_FONT_SIZE + 40).sp(using: using)),
      headline3: headline3.copyWith(
          fontSize: (DEFAULT_FONT_SIZE + 30).sp(using: using)),
      headline4: headline4.copyWith(
          fontSize: (DEFAULT_FONT_SIZE + 20).sp(using: using)),
      headline5: headline5.copyWith(
          fontSize: (DEFAULT_FONT_SIZE + 10).sp(using: using)),
      headline6: headline6.copyWith(
          fontSize: (DEFAULT_FONT_SIZE + 6).sp(using: using)),
      subtitle1: subtitle1.copyWith(
          fontSize: (DEFAULT_FONT_SIZE + 2).sp(using: using)),
      subtitle2:
          subtitle2.copyWith(fontSize: DEFAULT_FONT_SIZE.sp(using: using)),
      bodyText1:
          bodyText1.copyWith(fontSize: DEFAULT_FONT_SIZE.sp(using: using)),
      bodyText2:
          bodyText2.copyWith(fontSize: DEFAULT_FONT_SIZE.sp(using: using)),
      caption:
          caption.copyWith(fontSize: (DEFAULT_FONT_SIZE - 2).sp(using: using)),
      button: button.copyWith(fontSize: DEFAULT_FONT_SIZE.sp(using: using)),
      overline:
          overline.copyWith(fontSize: (DEFAULT_FONT_SIZE - 4).sp(using: using)),
    );

    final _localizedTheme = ThemeData.localize(_themeData, textTheme);
    return _localizedTheme.copyWith(
      buttonTheme: _localizedTheme.buttonTheme.copyWith(
        buttonColor: isDarkMode ? AppColors.doctorWhite : AppColors.fireEngine,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
