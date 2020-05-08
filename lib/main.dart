import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thevinesh/bloc_delegate.dart';
import 'package:thevinesh/components/components.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/page/page.dart';
import 'package:thevinesh/widgets/widgets.dart';

void main() {
  BlocSupervisor.delegate = SiteBlocDelegate();
  runApp(
    BlocProvider(
      create: (context) => PageBloc(),
      child: SiteApp(),
    ),
  );
}

class SiteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: SiteTheme.theme,
      title: SiteStrings.appName,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TextBackgroundView(
          textColor: SiteTheme.redLight,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NavBar(),
                PageBody(),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
