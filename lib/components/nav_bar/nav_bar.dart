import 'package:flutter/material.dart';
import 'package:thevinesh/page/pages.dart';
import 'package:thevinesh/utils/utils.dart';

part 'nav_bar_button.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  final double preferredHeight;

  const NavBar({@required this.preferredHeight})
      : assert(preferredHeight != null),
        assert(preferredHeight > 64.0);

  @override
  _NavBarState createState() => _NavBarState();

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.from(
        colorScheme: Theme.of(context).colorScheme,
        textTheme: Theme.of(context).primaryTextTheme,
      ),
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Row(
          children: AppPage.values.map((page) => NavBarButton(page)).toList(),
        ),
      ),
    );
  }
}
