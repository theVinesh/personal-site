import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'resume_store.g.dart';

class ResumeStore = _ResumeStore with _$ResumeStore;

abstract class _ResumeStore with Store {
  static const String _RESUME_MD_PATH = "resume/resume.md";
  @observable
  String resumeData;

  _ResumeStore() {
    initResumeData();
  }

  @action
  Future<void> initResumeData() async {
    resumeData = await rootBundle.loadString(_RESUME_MD_PATH, cache: true);
  }
}
