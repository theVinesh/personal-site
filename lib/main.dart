import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:thevinesh/common_stores/common_stores.dart';
import 'package:thevinesh/components/components.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/page/pages.dart';
import 'package:thevinesh/utils/utils.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    final appStore = AppStore();
    final router = AppRouter(appStore: appStore);
    runApp(
      MultiProvider(
        providers: [
          Provider<AppStore>(create: (_) => appStore),
          Provider<AppRouter>(create: (_) => router),
        ],
        child: MaterialApp(
          navigatorKey: AppRouter.globalNavKey,
          debugShowCheckedModeBanner: false,
          initialRoute: AppPage.home.route,
          title: AppStrings.appName,
          onGenerateRoute: router.generateRoute,
        ),
      ),
    );
  }, (dynamic error, StackTrace stackTrace) {
    log(error.toString(), stackTrace: stackTrace);
  });
}

class Site extends StatefulWidget {
  final WidgetBuilder pageBodyBuilder;

  const Site({this.pageBodyBuilder});

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
        data: AppTheme.theme(using: context, isDarkMode: _store.darkMode),
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
              widget.pageBodyBuilder(context),
            ],
          ),
        ),
      ),
    );
  }
}
