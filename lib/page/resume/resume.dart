import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:thevinesh/page/resume/store/resume_store.dart';
import 'package:thevinesh/utils/utils.dart';

class Resume extends StatefulWidget {
  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  ResumeStore _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store ??= ResumeStore();
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
        children: [
          Observer(builder: (_) {
            if (_store.resumeData == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return MarkdownBody(data: _store.resumeData);
            }
          }),
        ],
      ),
    );
  }
}
