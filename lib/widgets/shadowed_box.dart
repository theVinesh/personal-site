import 'package:flutter/material.dart';
import 'package:thevinesh/utils/utils.dart';

class ShadowedBox extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final EdgeInsetsGeometry padding;
  final Offset shadowOffset;
  final Color boxColor;
  final Color shadowColor;

  const ShadowedBox({
    @required this.child,
    this.height,
    this.width,
    this.padding,
    this.shadowOffset,
    this.boxColor,
    this.shadowColor,
  }) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: boxColor ?? Theme.of(context).colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Theme.of(context).colorScheme.primaryVariant,
            offset: shadowOffset ??
                Offset(
                  6.dp(using: context),
                  6.dp(using: context),
                ),
          )
        ],
      ),
      child: child,
    );
  }
}
