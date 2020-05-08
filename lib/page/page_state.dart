part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  final SitePage page;

  const PageState(this.page);
}

class PageLoadInProgress extends PageState {
  PageLoadInProgress(SitePage page) : super(page);

  @override
  List<Object> get props => [page];
}

class PageLoadSuccess extends PageState {
  PageLoadSuccess(SitePage page) : super(page);

  @override
  List<Object> get props => [page];
}

class PageLoadFailed extends PageState {
  PageLoadFailed(SitePage page) : super(page);

  @override
  List<Object> get props => [page];
}
