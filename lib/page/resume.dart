import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:thevinesh/common_stores/common_stores.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/widgets/md_body.dart';

class Resume extends StatefulWidget {
  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  MdPageStore _store;

  @override
  void initState() {
    _store = MdPageStore(Pages.RESUME);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppDimen.getDefaultPadding(context),
      child: Observer(builder: (_) {
        if (_store.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return MdBody(_store.mdData);
        }
      }),
    );
  }
}
