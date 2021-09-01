import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/utils/utils.dart';

class MdBody extends StatelessWidget {
  final String? mdData;
  final MarkdownStyleSheet? mdStyleSheet;

  const MdBody(this.mdData, {this.mdStyleSheet});

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: mdData ?? "",
      selectable: true,
      styleSheet: mdStyleSheet ?? AppTheme.mdStyleSheet(using: context),
      onTapLink: (_, link, __) => tryLaunch(link),
    );
  }
}
