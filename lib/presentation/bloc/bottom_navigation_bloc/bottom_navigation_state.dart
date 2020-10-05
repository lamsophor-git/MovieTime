part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();
}

class HomeState extends BottomNavigationState {
  final int index = 0;
  @override
  List<Object> get props => [index];
}

class WatchListState extends BottomNavigationState {
  final int index = 1;
  @override
  List<Object> get props => [index];
}

class AccountState extends BottomNavigationState {
  final int index = 2;
  @override
  List<Object> get props => [index];
}
