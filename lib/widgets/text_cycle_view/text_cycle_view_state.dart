part of './text_cycle_view_bloc.dart';

abstract class TextCycleViewState extends Equatable {
  const TextCycleViewState();
}

class TextCycleNext extends TextCycleViewState{
  final int index;

  const TextCycleNext(this.index);

  @override
  List<Object> get props => [index];
}
