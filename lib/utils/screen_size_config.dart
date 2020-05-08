import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double textScaleFactor;
  static double biggestBlock;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    biggestBlock = max(blockSizeVertical,blockSizeHorizontal);
    textScaleFactor = lerpDouble(1, 1.05, blockSizeHorizontal);
  }
}
