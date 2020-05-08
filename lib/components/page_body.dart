import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thevinesh/page/page.dart';
import 'package:thevinesh/screens/screens.dart';
import 'package:thevinesh/utils/screen_size_config.dart';
import 'package:thevinesh/widgets/widgets.dart';

class PageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      constraints: BoxConstraints(
          minHeight: SizeConfig.blockSizeVertical * 90,
          minWidth: SizeConfig.blockSizeHorizontal * 25,
          maxWidth: SizeConfig.blockSizeHorizontal * 80),
      padding: EdgeInsets.symmetric(
        vertical: 64,
        horizontal: 8,
      ),
      alignment: Alignment.topCenter,
      child: BlocBuilder<PageBloc, PageState>(
        builder: (context, state) => _buildPage(context, state),
      ),
    );
  }

  Widget _buildPage(BuildContext context, PageState state) {
    if (state is PageLoadSuccess) {
      switch (state.page) {
        case SitePage.resume:
          return ScreenResume();
        default:
          return BlocProvider(
            create: (_) => TextCycleViewBloc()..add(TextCycleStarted()),
            child: ScreenHome(),
          );
      }
    } else {
      return Text("Loading");
    }
  }
}
