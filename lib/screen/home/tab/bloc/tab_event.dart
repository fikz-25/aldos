import 'package:equatable/equatable.dart';
import 'package:aldo/screen/home/tab/bloc/tab_state.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TabEvent extends Equatable {
  const TabEvent();
}

class UpdateTab extends TabEvent {
  final TabState tab;

  const UpdateTab(this.tab);

  @override
  List<Object> get props => [tab];

  @override
  String toString() => "UpdateTab";
}
