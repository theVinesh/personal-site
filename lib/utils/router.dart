import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thevinesh/common_stores/common_stores.dart';
import 'package:thevinesh/main.dart';
import 'package:thevinesh/page/pages.dart';

///app for Flutter routes
///self & external are for urls
///self to open on the same tab (on web)
///external to open on a separate tab
enum RouteType { app, self, external }

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
      case AppPage.blog:
        _name = "Blog";
        break;
      case AppPage.resume:
        _name = "Resume";
        break;
      case AppPage.uses:
        _name = "Uses";
        break;
    }
    assert(_name != null);
    return _name;
  }

  Widget get body {
    switch (this) {
      case AppPage.home:
        return Site(pageBodyBuilder: (_) => Home());
      case AppPage.resume:
        return Site(pageBodyBuilder: (_) => Resume());
      case AppPage.uses:
        return Site(pageBodyBuilder: (_) => Uses());
      default:
        return Site(pageBodyBuilder: (_) => FourOhFour());
    }
  }

  RouteType get type {
    switch (this) {
      case AppPage.blog:
      case AppPage.uses:
        return RouteType.self;
      default:
        return RouteType.app;
    }
  }

  String get route {
    switch (this) {
      case AppPage.home:
        return "/home";
      case AppPage.blog:
        return "https://blog.thevinesh.com";
      case AppPage.resume:
        return "/resume";
      case AppPage.uses:
        return "https://blog.thevinesh.com/posts/what-do-i-use/";
        break;
    }
    return "/404";
  }
}
