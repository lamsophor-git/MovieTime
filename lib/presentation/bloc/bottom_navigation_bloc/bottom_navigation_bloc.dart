import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(HomeState());

  @override
  Stream<BottomNavigationState> mapEventToState(
    BottomNavigationEvent event,
  ) async* {
    if(event is HomeEvent){
      yield HomeState();
    }
    if(event is WatchListEvent){
      yield WatchListState();
    }
    if(event is AccountEvent){
      yield AccountState();
    }
  }
}
