import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          child: Center(
            child: RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText2,
                    children: [
                  TextSpan(text: "Developed with Flutter by Vinesh")
                ])),
          ),
        ),
      ],
    );
  }
}
