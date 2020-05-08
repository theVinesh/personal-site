import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thevinesh/page/page.dart';
import 'package:thevinesh/widgets/widgets.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // ignore: close_sinks
  PageBloc _bloc;
  SitePage _currentTab;

  Map<SitePage, Widget> _createTabs() {
    Map tabsMap = Map<SitePage, Widget>();
    SitePage.values.forEach((tab) {
      tabsMap.putIfAbsent(
          tab,
          () => Text(
                "${tab.toName()}",
                style: Theme.of(context).primaryTextTheme.headline6,
              ));
    });
    return tabsMap;
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<PageBloc>(context);
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      color: Theme.of(context).primaryColorLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Spacer(),
          SlidingSegmentedControlWithThumbUnderneath(
            thumbColor: Theme.of(context).accentColor,
            children: _createTabs(),
            groupValue: _currentTab ?? PageBloc.initialPage,
            onValueChanged: (value) {
              _onTabSelected(value);
            },
          )
        ],
      ),
    );
  }

  void _onTabSelected(SitePage tab) => setState(() {
        _currentTab = tab;
        _bloc?.add(PageChangeClicked(tab));
      });
}
