import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:thevinesh/constants/constants.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  static const UPDATE_INTERVAL_IN_SECONDS = 2;

  Timer _timer;
  @observable
  String whatDoIDo;
  @observable
  int currentIndex = 0;
  bool isCyclingPaused = false;
  final _whatDoIDoList = AppStrings.whatDoIDo;

  _HomeStore() {
    whatDoIDo = _whatDoIDoList[currentIndex];
    _timer = Timer.periodic(
      Duration(seconds: UPDATE_INTERVAL_IN_SECONDS),
      (_) => cycleToNextWhatDoIDo(),
    );
  }

  @action
  void cycleToNextWhatDoIDo() {
    if (!isCyclingPaused) {
      currentIndex = ++currentIndex % _whatDoIDoList.length;
      whatDoIDo = _whatDoIDoList[currentIndex];
    }
  }

  void dispose() {
    _timer?.cancel();
  }
}