import 'package:mobx/mobx.dart';
import 'package:thevinesh/page/pages.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  bool darkMode = false;
  @observable
  AppPage currentPage = AppPage.home;

  @action
  void toggleDarkMode() => darkMode = !darkMode;
}
