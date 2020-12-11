import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:thevinesh/components/components.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/page/pages.dart';
import 'package:thevinesh/widgets/widgets.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    runApp(SiteApp());
  }, (dynamic error, StackTrace stackTrace) {
    log(error.toString(), stackTrace: stackTrace);
  });
}

class SiteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TextBackgroundView(
          textColor: AppColors.redLight,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ScreenHome(),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
