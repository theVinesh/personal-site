import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

export 'extensions.dart';
export 'screen_size.dart';

Future<bool> tryLaunch(String link) async {
  if (await canLaunch(link)) {
    return await launch(link);
  } else {
    log("Cannot launch $link");
    return false;
  }
}
