import 'package:flutter/material.dart';

class Resume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Resume is on Pause.\n\nComing soon.",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
