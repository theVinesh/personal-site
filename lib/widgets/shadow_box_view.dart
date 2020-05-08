import 'package:flutter/material.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/utils/utils.dart';

class ShadowBoxView extends StatelessWidget {
  final double minHeight;
  final EdgeInsetsGeometry padding;
  final Alignment alignment;
  final Color backgroundColor;
  final Color shadowColor;
  final Widget child;

  const ShadowBoxView(
      {@required this.child,
      this.minHeight = 32,
      this.padding,
      this.alignment = Alignment.centerLeft,
      this.backgroundColor = SiteTheme.redLight,
      this.shadowColor = SiteTheme.red});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      constraints: BoxConstraints(
        minHeight: minHeight,
        minWidth: double.infinity,
      ),
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 0,
            color: shadowColor,
            offset: Offset(
              SizeConfig.biggestBlock,
              SizeConfig.biggestBlock,
            ),
          ),
        ],
      ),
      child: child,
    );
  }
}
