import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/page/home/store/home_store.dart';
import 'package:thevinesh/utils/utils.dart';
import 'package:thevinesh/widgets/shadowed_box.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeStore _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store ??= HomeStore();
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 32.sp(using: context),
        horizontal: (context.screenSize <= ScreenSize.medium ? 16 : 64)
            .sp(using: context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.helloWorld,
            style: Theme.of(context).textTheme.headline5,
          ),
          Observer(
            builder: (_) => _Hero(whatDoIDo: _store.whatDoIDo),
          ),
          SizedBox(height: 16.dp(using: context)),
          Text(
            AppStrings.introText,
            style: Theme.of(context).textTheme.bodyText2.copyWith(height: 2),
          ),
        ],
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  final String whatDoIDo;

  const _Hero({@required this.whatDoIDo}) : assert(whatDoIDo != null);

  @override
  Widget build(BuildContext context) {
    return ShadowedBox(
      padding: EdgeInsets.all(32.sp(using: context)),
      height: (context.screenSize <= ScreenSize.medium ? 200 : 128)
          .sp(using: context),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
            text: AppStrings.iAmVinesh,
            children: [TextSpan(text: whatDoIDo), TextSpan(text: ".")],
          ),
        ),
      ),
    );
  }
}
