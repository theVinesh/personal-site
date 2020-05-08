part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class PageChangeClicked extends PageEvent {
  final SitePage page;

  const PageChangeClicked(this.page);

  @override
  List<Object> get props => [page];
}
