import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

export 'extensions.dart';
export 'router.dart';
export 'screen_size.dart';

Future<bool> tryLaunch(String? link) async {
  if (link == null || !(await canLaunch(link))) {
    log("Cannot launch $link");
    return false;
  } else {
    return await launch(link);
  }
}
