import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part './text_cycle_view_event.dart';

part './text_cycle_view_state.dart';

class TextCycleViewBloc extends Bloc<TextCycleViewEvent, TextCycleViewState> {
  final _delayInMilliseconds = 1750;
  int _currentCycle = 0;
  StreamSubscription _subscription;

  @override
  TextCycleViewState get initialState => TextCycleNext(_currentCycle);

  @override
  Stream<TextCycleViewState> mapEventToState(TextCycleViewEvent event) async* {
    yield* _onNext(event);
  }

  Stream<TextCycleViewState> _onNext(TextCycleViewEvent event) async* {
    if (event is TextCycleStarted) {
      _currentCycle = 0;
      add(TextCycleResumed());
    }

    if (event is TextCycleResumed) {
      if (_subscription == null) {
        _subscription =
            Stream.periodic(Duration(milliseconds: _delayInMilliseconds))
                .listen(
          (event) {
            add(TextCycleOnNext());
          },
        );
      } else {
        _subscription.resume();
      }
    }

    if (event is TextCyclePaused) {
      _subscription.pause();
    }

    if (event is TextCycleOnNext) {
      _currentCycle++;
    }
    yield TextCycleNext(_currentCycle);
  }

  @override
  Future<Function> close() async {
    await _subscription.cancel();
    await super.close();
  }
}
