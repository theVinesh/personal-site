import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/utils/utils.dart';

class AppTheme {
  static const double DEFAULT_FONT_SIZE = 14.0;

  static ThemeData theme(
      {required BuildContext using, bool isDarkMode = false}) {
    final _darkColorScheme = ColorScheme(
      primary: AppColors.fireEngine,
      onPrimary: AppColors.white,
      secondary: AppColors.nero,
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
      onPrimary: AppColors.white,
      secondary: AppColors.nero,
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
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      dialogBackgroundColor: colorScheme.background,
      indicatorColor: onPrimarySurfaceColor,
      applyElevationOverlayColor: isDarkMode,
      fontFamily: Fonts.OXYGEN_MONO_REGULAR_FAMILY, bottomAppBarTheme: BottomAppBarTheme(color: colorScheme.surface), colorScheme: colorScheme.copyWith(secondary: colorScheme.secondary).copyWith(background: colorScheme.background).copyWith(error: colorScheme.error),
    );

    ///_________________

    /// Extremely large text.
    final TextStyle headline1 = _themeData.textTheme.displayLarge!;

    /// Very, very large text.
    ///
    /// Used for the date in the dialog shown by [showDatePicker].
    final TextStyle headline2 = _themeData.textTheme.displayMedium!;

    /// Very large text.
    final TextStyle headline3 = _themeData.textTheme.displaySmall!;

    /// Large text.
    final TextStyle headline4 = _themeData.textTheme.headlineMedium!;

    /// Used for large text in dialogs (e.g., the month and year in the dialog
    /// shown by [showDatePicker]).
    final TextStyle headline5 = _themeData.textTheme.headlineSmall!;

    /// Used for the primary text in app bars and dialogs (e.g., [AppBar.title]
    /// and [AlertDialog.title]).
    final TextStyle headline6 = _themeData.textTheme.titleLarge!;

    /// Used for the primary text in lists (e.g., [ListTile.title]).
    final TextStyle subtitle1 = _themeData.textTheme.titleMedium!;

    /// For medium emphasis text that's a little smaller than [subtitle1].
    final TextStyle subtitle2 = _themeData.textTheme.titleSmall!;

    /// Used for emphasizing text that would otherwise be [bodyText2].
    final TextStyle bodyText1 = _themeData.textTheme.bodyLarge!;

    /// The default text style for [Material].
    final TextStyle bodyText2 = _themeData.textTheme.bodyMedium!;

    /// Used for auxiliary text associated with images.
    final TextStyle caption = _themeData.textTheme.bodySmall!;

    /// Used for text on [ElevatedButton], [TextButton] and [OutlinedButton].
    final TextStyle button = _themeData.textTheme.labelLarge!;

    /// The smallest style.
    ///
    /// Typically used for captions or to introduce a (larger) headline.
    final TextStyle overline = _themeData.textTheme.labelSmall!;

    final textTheme = _themeData.textTheme.copyWith(
      displayLarge: headline1.copyWith(
          fontSize: (DEFAULT_FONT_SIZE + 80).sp(using: using)),
      displayMedium: headline2.copyWith(
          fontSize: (DEFAULT_FONT_SIZE + 40).sp(using: using)),
      displaySmall: headline3.copyWith(
          fontSize: (DEFAULT_FONT_SIZE + 30).sp(using: using)),
      headlineMedium: headline4.copyWith(
          fontSize: (DEFAULT_FONT_SIZE + 20).sp(using: using)),
      headlineSmall: headline5.copyWith(
          fontSize: (DEFAULT_FONT_SIZE + 10).sp(using: using)),
      titleLarge: headline6.copyWith(
          fontSize: (DEFAULT_FONT_SIZE + 6).sp(using: using)),
      titleMedium: subtitle1.copyWith(
          fontSize: (DEFAULT_FONT_SIZE + 2).sp(using: using)),
      titleSmall:
          subtitle2.copyWith(fontSize: DEFAULT_FONT_SIZE.sp(using: using)),
      bodyLarge:
          bodyText1.copyWith(fontSize: DEFAULT_FONT_SIZE.sp(using: using)),
      bodyMedium:
          bodyText2.copyWith(fontSize: DEFAULT_FONT_SIZE.sp(using: using)),
      bodySmall:
          caption.copyWith(fontSize: (DEFAULT_FONT_SIZE - 2).sp(using: using)),
      labelLarge: button.copyWith(fontSize: DEFAULT_FONT_SIZE.sp(using: using)),
      labelSmall:
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

  static MarkdownStyleSheet mdStyleSheet({required BuildContext using}) {
    final theme = Theme.of(using);
    return MarkdownStyleSheet(
      a: TextStyle(
        color: AppColors.fireEngine,
        decoration: TextDecoration.underline,
      ),
      p: theme.textTheme.bodyMedium!,
      code: theme.textTheme.bodyMedium!.copyWith(
        backgroundColor: theme.cardTheme.color ?? theme.cardColor,
        fontFamily: "monospace",
        fontSize: theme.textTheme.bodyMedium!.fontSize! * 0.85,
      ),
      h1: theme.textTheme.headlineSmall!,
      h2: theme.textTheme.titleLarge!,
      h3: theme.textTheme.titleMedium!,
      h4: theme.textTheme.bodyMedium!,
      h5: theme.textTheme.bodyLarge!,
      h6: theme.textTheme.bodyLarge!,
      em: const TextStyle(fontStyle: FontStyle.italic),
      strong: const TextStyle(fontWeight: FontWeight.bold),
      del: const TextStyle(decoration: TextDecoration.lineThrough),
      blockquote: theme.textTheme.bodyMedium!,
      img: theme.textTheme.bodyMedium!,
      checkbox: theme.textTheme.bodyMedium!.copyWith(
        color: theme.primaryColor,
      ),
      blockSpacing: 8.0,
      listIndent: 24.0,
      listBullet: theme.textTheme.bodyMedium!,
      tableHead: const TextStyle(fontWeight: FontWeight.w600),
      tableBody: theme.textTheme.bodyMedium!,
      tableHeadAlign: TextAlign.center,
      tableBorder: TableBorder.all(
        color: theme.dividerColor,
        width: 1,
      ),
      tableColumnWidth: const FlexColumnWidth(),
      tableCellsPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      tableCellsDecoration: const BoxDecoration(),
      blockquotePadding: const EdgeInsets.all(8.0),
      blockquoteDecoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(2.0),
      ),
      codeblockPadding: const EdgeInsets.all(8.0),
      codeblockDecoration: BoxDecoration(
        color: theme.cardTheme.color ?? theme.cardColor,
        borderRadius: BorderRadius.circular(2.0),
      ),
      horizontalRuleDecoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 2.0,
            color: theme.dividerColor,
          ),
        ),
      ),
    );
  }

  static MarkdownStyleSheet footerTheme({required BuildContext using}) {
    final baseTheme = mdStyleSheet(using: using);
    return baseTheme.copyWith(p: Theme.of(using).textTheme.labelSmall!);
  }
}
