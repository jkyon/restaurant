import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_finder/src/repositories/user_history_repositry.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final UserHistoryRepository historyRepository;
  HistoryBloc({this.historyRepository}) : super(HistoryInitial());

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
