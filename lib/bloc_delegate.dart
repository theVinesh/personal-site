import 'package:bloc/bloc.dart';

class SiteBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print('${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    print('${bloc.runtimeType} $error');
    super.onError(bloc, error, stacktrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }
}
