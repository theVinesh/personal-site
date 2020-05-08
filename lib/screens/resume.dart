import 'package:flutter/material.dart';

class ScreenResume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Resume is on Pause, coming soon",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
