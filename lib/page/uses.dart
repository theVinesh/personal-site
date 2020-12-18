import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:thevinesh/common_stores/common_stores.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/utils/utils.dart';

class Uses extends StatefulWidget {
  @override
  _UsestateState createState() => _UsestateState();
}

class _UsestateState extends State<Uses> {
  MdPageStore _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store ??= MdPageStore(Blogs.USES);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppDimen.getDefaultPadding(context),
      child: Observer(builder: (_) {
        if (_store.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return MarkdownBody(
            data: _store.mdData,
            onTapLink: (_, link, __) => tryLaunch(link),
          );
        }
      }),
    );
  }
}
