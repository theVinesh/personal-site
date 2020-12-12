import 'dart:math';

import 'package:flutter/material.dart';

extension XString on String {
  String stripMargin() => this.splitMapJoin(RegExp(r'^', multiLine: true),
      onMatch: (_) => "\n", onNonMatch: (s) => s.trim());
}

extension XBuildContext on BuildContext {
  double get screenDiagonalPx {
    final screenSize = MediaQuery.of(this).size;
    return sqrt(pow(screenSize.width, 2) + pow(screenSize.height, 2));
  }

  double get scalingFactor {
    final screenDiagonalPx = this.screenDiagonalPx;
    if (screenDiagonalPx <= 6.inch) {
      //0in > diagonal <= 6in
      return 1;
    } else if (screenDiagonalPx <= 15.inch) {
      //6in> diagonal <= 15in
      return 1.3;
    } else {
      //15in> diagonal <= infinity
      return 1.5;
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
