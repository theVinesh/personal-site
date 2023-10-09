import 'package:flutter/material.dart';

class DesignTestScreen extends StatefulWidget {
  @override
  _DesignTestScreenState createState() => _DesignTestScreenState();
}

class _DesignTestScreenState extends State<DesignTestScreen> {
  late Map<String, TextStyle?> _textStyles;

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

  Map<String, TextStyle?> _initTextStyles(ThemeData theme) {
    _textStyles = {
      'Headline 1': theme.textTheme.displayLarge,
      'Headline 2': theme.textTheme.displayMedium,
      'Headline 3': theme.textTheme.displaySmall,
      'Headline 4': theme.textTheme.headlineMedium,
      'Headline 5': theme.textTheme.headlineSmall,
      'Headline 6': theme.textTheme.titleLarge,
      'Subtitle 1': theme.textTheme.titleMedium,
      'Subtitle 2': theme.textTheme.titleSmall,
      'Body Text 1': theme.textTheme.bodyLarge,
      'Body Text 2': theme.textTheme.bodyMedium,
      'Caption': theme.textTheme.bodySmall,
      'Button': theme.textTheme.labelLarge,
      'Overline': theme.textTheme.labelSmall,
    };
    return _textStyles;
  }
}
