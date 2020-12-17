import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:thevinesh/components/components.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/page/pages.dart';
import 'package:thevinesh/page/store/app_store.dart';
import 'package:thevinesh/utils/utils.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    final appStore = AppStore();
    runApp(
      MultiProvider(providers: [
        Provider(create: (_) => appStore),
      ], child: SiteApp()),
    );
  }, (dynamic error, StackTrace stackTrace) {
    log(error.toString(), stackTrace: stackTrace);
  });
}

class SiteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Site(),
        title: AppStrings.appName,
      );
}

class Site extends StatefulWidget {
  @override
  _SiteState createState() => _SiteState();
}

class _SiteState extends State<Site> {
  AppStore _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store ??= context.read<AppStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Theme(
        data: AppTheme.theme(using: context, darkMode: _store.darkMode),
        child: Scaffold(
          appBar: NavBar(
              appStore: _store,
              preferredHeight: AppDimen.NAV_BAR_HEIGHT.dp(using: context)),
          body: Stack(
            children: [
              Text(
                AppStrings.bgWordWall,
                style: Theme.of(context).textTheme.headline1.copyWith(
                      color: _store.bgWallColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              _store.currentPage.widget,
            ],
          ),
        ),
      ),
    );
  }
}
