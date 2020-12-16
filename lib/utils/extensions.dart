import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thevinesh/utils/utils.dart';

extension XString on String {
  String stripMargin() => this.splitMapJoin(RegExp(r'^', multiLine: true),
      onMatch: (_) => "\n", onNonMatch: (s) => s.trim());
}

extension XBuildContext on BuildContext {
  double get screenDiagonalPx {
    final screenSize = MediaQuery.of(this).size;
    return sqrt(pow(screenSize.width, 2) + pow(screenSize.height, 2));
  }

  ScreenSize get screenSize {
    final currentScreenDiagonalInInches = this.screenDiagonalPx.pxToIn;
    return ScreenSize.values.firstWhere((screenSize) =>
        currentScreenDiagonalInInches <= screenSize.maxDiagonalInInches());
  }

  double get scalingFactor {
    switch (this.screenSize) {
      case ScreenSize.small:
        return 1;
      case ScreenSize.medium:
        return 1.3;
      case ScreenSize.large:
        return 1.5;
      default: // ScreenSize.xlarge
        return 1.7;
    }
  }
}

extension XNum on num {
  static const ONE_INCH_IN_OP = 96.0;

  double get inch => this * ONE_INCH_IN_OP;

  double get pxToIn => this / ONE_INCH_IN_OP;

  double sp({BuildContext using}) => this * using.scalingFactor;

  double dp({BuildContext using}) =>
      this * MediaQuery.of(using).devicePixelRatio;
}
