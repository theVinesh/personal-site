part of './text_cycle_view_bloc.dart';

abstract class TextCycleViewEvent extends Equatable {
  const TextCycleViewEvent();
}

class TextCycleStarted extends TextCycleViewEvent {
  @override
  List<Object> get props => [];
}

class TextCyclePaused extends TextCycleViewEvent {
  @override
  List<Object> get props => [];
}

class TextCycleResumed extends TextCycleViewEvent {
  @override
  List<Object> get props => [];
}

class TextCycleOnNext extends TextCycleViewEvent {
  @override
  List<Object> get props => [];
}
