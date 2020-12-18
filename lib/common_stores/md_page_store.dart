import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:thevinesh/constants/constants.dart';

part 'md_page_store.g.dart';

class MdPageStore = _MdPageStore with _$MdPageStore;

abstract class _MdPageStore with Store {
  @observable
  bool isLoading = false;

  @observable
  String mdData;

  final String filePath;

  _MdPageStore(this.filePath) {
    loadMdFile();
  }

  @action
  Future<void> loadMdFile() async {
    isLoading = true;
    try {
      mdData = await rootBundle.loadString(this.filePath, cache: true);
    } catch (e, st) {
      mdData = AppStrings.someThingWentWrongMd;
      log(e.toString(), stackTrace: st);
    } finally {
      isLoading = false;
    }
  }
}
