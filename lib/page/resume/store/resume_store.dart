import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:thevinesh/constants/constants.dart';

part 'resume_store.g.dart';

class ResumeStore = _ResumeStore with _$ResumeStore;

abstract class _ResumeStore with Store {
  @observable
  String resumeData;

  _ResumeStore() {
    initResumeData();
  }

  @action
  Future<void> initResumeData() async {
    resumeData = await rootBundle.loadString(Pages.RESUME_MD, cache: true);
  }
}
