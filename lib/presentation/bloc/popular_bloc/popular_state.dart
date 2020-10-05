part of 'popular_bloc.dart';

abstract class PopularState extends Equatable {
  const PopularState();
}

class PopularInitial extends PopularState {
  @override
  List<Object> get props => [];
}
class PopularLoadingState extends PopularState {
  @override
  List<Object> get props => [];
}
class PopularSuccessState extends PopularState {
  final MovieList movieList;

  PopularSuccessState(this.movieList);
  @override
  List<Object> get props => [];
}class PopularErrorState extends PopularState {
  final String message;

  PopularErrorState(this.message);
  @override
  List<Object> get props => [];
}

