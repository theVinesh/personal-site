import 'package:flutter/material.dart';
import 'package:thevinesh/page/home.dart';
import 'package:thevinesh/page/resume.dart';

export 'home.dart';
export 'resume.dart';

enum AppPage {
  home,
  resume,
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
    }
    assert(_name != null);
    return _name;
  }

  // ignore: missing_return
  Widget get widget {
    switch (this) {
      case AppPage.home:
        return ScreenHome();
      case AppPage.resume:
        return ScreenResume();
    }
  }
}
