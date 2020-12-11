export 'home.dart';
export 'resume.dart';

enum SitePage {
  home,
  //resume,
}

extension SitePageName on SitePage {
  String toName() {
    String name;
    switch (this) {
      case SitePage.home:
        name = "Home";
        break;
      /*case SitePage.resume:
        name = "Resume";
        break;*/
    }
    assert(name != null);
    return name;
  }
}
