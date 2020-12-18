import 'package:flutter/widgets.dart';
import 'package:thevinesh/utils/utils.dart';

class AppDimen {
  static const NAV_BAR_HEIGHT = 64.0;

  static EdgeInsetsGeometry getDefaultPadding(BuildContext context) =>
      EdgeInsets.symmetric(
        vertical: 32.sp(using: context),
        horizontal: (context.screenSize <= ScreenSize.medium ? 16 : 64)
            .sp(using: context),
      );
}
