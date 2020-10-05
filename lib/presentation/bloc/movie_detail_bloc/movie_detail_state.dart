part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();
}

class MovieDetailInitial extends MovieDetailState {
  @override
  List<Object> get props => [];
}
class MovieDetailLoadingState extends MovieDetailState {
  @override
  List<Object> get props => [];
}
class MovieDetailSuccessState extends MovieDetailState {
  final MovieDetail movieDetail;
  MovieDetailSuccessState(this.movieDetail);
  @override
  List<Object> get props => [];
}
class MovieDetailErroeState extends MovieDetailState {
  final String message;
  MovieDetailErroeState(this.message);
  @override
  List<Object> get props => [];
}
