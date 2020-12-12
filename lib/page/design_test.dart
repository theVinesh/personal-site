import 'package:flutter/material.dart';

class DesignTestScreen extends StatefulWidget {
  @override
  _DesignTestScreenState createState() => _DesignTestScreenState();
}

class _DesignTestScreenState extends State<DesignTestScreen> {
  Map<String, TextStyle> _textStyles;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initTextStyles(Theme.of(context));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _textStyles.length,
      itemBuilder: (_, int index) {
        final name = _textStyles.keys.elementAt(index);
        final style = _textStyles[name];
        return Text(name, style: style);
      },
    );
  }

  Map<String, TextStyle> _initTextStyles(ThemeData theme) {
    _textStyles = {
      'Headline 1': theme.textTheme.headline1,
      'Headline 2': theme.textTheme.headline2,
      'Headline 3': theme.textTheme.headline3,
      'Headline 4': theme.textTheme.headline4,
      'Headline 5': theme.textTheme.headline5,
      'Headline 6': theme.textTheme.headline6,
      'Subtitle 1': theme.textTheme.subtitle1,
      'Subtitle 2': theme.textTheme.subtitle2,
      'Body Text 1': theme.textTheme.bodyText1,
      'Body Text 2': theme.textTheme.bodyText2,
      'Caption': theme.textTheme.caption,
      'Button': theme.textTheme.button,
      'Overline': theme.textTheme.overline,
    };
    return _textStyles;
  }
}
