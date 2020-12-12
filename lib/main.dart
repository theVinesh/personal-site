import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:thevinesh/components/nav_bar/nav_bar.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/page/pages.dart';
import 'package:thevinesh/utils/utils.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    runApp(SiteApp());
  }, (dynamic error, StackTrace stackTrace) {
    log(error.toString(), stackTrace: stackTrace);
  });
}

class SiteApp extends StatefulWidget {
  @override
  _SiteAppState createState() => _SiteAppState();
}

class _SiteAppState extends State<SiteApp> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        home: SiteBody(),
      ),
    );
  }
}

class SiteBody extends StatefulWidget {
  @override
  _SiteBodyState createState() => _SiteBodyState();
}

class _SiteBodyState extends State<SiteBody> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.theme(using: context),
      child: Scaffold(
        appBar: NavBar(preferredHeight: 64.dp(using: context)),
        body: ScreenHome(),
      ),
    );
  }
}
