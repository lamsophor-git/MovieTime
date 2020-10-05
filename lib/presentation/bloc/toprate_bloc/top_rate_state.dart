part of 'top_rate_bloc.dart';

abstract class TopRateState extends Equatable {
  const TopRateState();
}

class TopRateInitial extends TopRateState {
  @override
  List<Object> get props => [];
}
class TopRateLoadingState extends TopRateState {
  @override
  List<Object> get props => [];
}
class TopRateSuccessState extends TopRateState {
  final MovieList movieList;

  TopRateSuccessState(this.movieList);
  @override
  List<Object> get props => [];
}class TopRateErrorState extends TopRateState {
  final String message;

  TopRateErrorState(this.message);
  @override
  List<Object> get props => [];
}

