import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thevinesh/page/page.dart';

part 'page_event.dart';

part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  static final initialPage = SitePage.home;

  @override
  PageState get initialState => PageLoadSuccess(initialPage);

  @override
  Stream<PageState> mapEventToState(PageEvent event) async* {
    if (event is PageChangeClicked) {
      yield PageLoadInProgress(event.page);
      yield PageLoadSuccess(event.page);
    }
  }
}
