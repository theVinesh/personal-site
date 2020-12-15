import 'package:flutter/material.dart';
import 'package:thevinesh/page/design_test.dart';
import 'package:thevinesh/page/home.dart';
import 'package:thevinesh/page/resume/resume.dart';

export 'design_test.dart';
export 'home.dart';
export 'resume/resume.dart';
export 'unknown.dart';

enum AppPage {
  home,
  resume,
  design_test,
  //uses,
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
      case AppPage.design_test:
        _name = "Design Test";
        break;
    }
    assert(_name != null);
    return _name;
  }

  // ignore: missing_return
  Widget get widget {
    switch (this) {
      case AppPage.home:
        return Home();
      case AppPage.resume:
        return Resume();
      case AppPage.design_test:
        return DesignTestScreen();
    }
  }

  String get route {
    switch (this) {
      case AppPage.home:
        return "/home";
      case AppPage.resume:
        return "/resume";
      case AppPage.design_test:
        return "/design_test";
    }
    return "/404";
  }
}
