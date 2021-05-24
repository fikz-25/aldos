import 'package:aldo/screen/home/tab/bloc/tab_event.dart';
import 'package:aldo/screen/home/tab/bloc/tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  @override
  TabState get initialState => TabState.home;

  @override
  Stream<TabState> mapEventToState(
    TabEvent event,
  ) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}
