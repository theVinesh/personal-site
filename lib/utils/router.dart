import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thevinesh/main.dart';
import 'package:thevinesh/page/pages.dart';
import 'package:thevinesh/page/store/app_store.dart';

class AppRouter {
  static final globalNavKey =
      GlobalKey<NavigatorState>(debugLabel: "globalNavKey");
  final AppStore appStore;

  const AppRouter({@required this.appStore}) : assert(appStore != null);

  AppPage _getPageFor(String route) => AppPage.values
      .firstWhere((page) => page.route == route, orElse: () => AppPage.home);

  Route<dynamic> generateRoute(RouteSettings settings) {
    final newPage = _getPageFor(settings.name);
    appStore.currentPage = newPage;
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (___, __, _) => newPage.body,
    );
  }
}

extension XAppPage on AppPage {
  String get name {
    String _name;
    switch (this) {
      case AppPage.home:
        _name = "Home";
        break;
      case AppPage.resume:
        _name = "Resume";
        break;
    }
    assert(_name != null);
    return _name;
  }

  // ignore: missing_return
  Widget get body {
    switch (this) {
      case AppPage.home:
        return Site(pageBodyBuilder: (_) => Home());
      case AppPage.resume:
        return Site(pageBodyBuilder: (_) => Resume());
      default:
        return Site(pageBodyBuilder: (_) => FourOhFour());
    }
  }

  String get route {
    switch (this) {
      case AppPage.home:
        return "/home";
      case AppPage.resume:
        return "/resume";
    }
    return "/404";
  }
}
