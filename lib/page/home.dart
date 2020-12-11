import 'package:flutter/material.dart';
import 'package:thevinesh/utils/utils.dart';

class ScreenHome extends StatelessWidget {
  static const _verbs = [
    "Dream",
    "Think",
    "Design",
    "Code",
    "Read",
    "Learn",
    "Make",
    "Sing",
    "Sketch",
    "Cook",
    "Party",
  ];

  static const _roleColors = [
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.lightBlueAccent,
    Colors.lightGreenAccent,
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headline3,
            children: [
              TextSpan(text: "hello world"),
            ],
          ),
          textScaleFactor: SizeConfig.textScaleFactor,
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headline6,
            children: [
              TextSpan(
                  text:
                      "I am an UX/UI design/developer from India.\n\nCurrently, I work at Swiggy as an Android Developer.\n-"),
            ],
          ),
          textScaleFactor: SizeConfig.textScaleFactor,
        ),
      ],
    );
  }
}
