import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/page/home/model/social.dart';
import 'package:thevinesh/utils/utils.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  static const UPDATE_INTERVAL_IN_SECONDS = 2;

  Timer? _timer;
  @observable
  String whatDoIDo = "";
  @observable
  int currentIndex = 0;
  bool isCyclingPaused = false;
  final _whatDoIDoList = ObservableList.of(AppStrings.whatDoIDo);
  final socialButtons = [
    Social(name: "twitter", link: "https://twitter.com/theVinesh"),
    Social(name: "github", link: "https://github.com/theVinesh"),
    Social(name: "linkedIn", link: "https://linkedin.com/in/theVinesh"),
    //Social(name: "telegram", link: "https://t.me/theVinesh"),
  ];

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

  void onSocialButtonTapped(Social social) => tryLaunch(social.link);

  void dispose() {
    _timer?.cancel();
  }
}
