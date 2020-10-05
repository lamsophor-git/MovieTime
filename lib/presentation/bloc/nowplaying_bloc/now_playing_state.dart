part of 'now_playing_bloc.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();
}

class NowPlayingInitial extends NowPlayingState {
  @override
  List<Object> get props => [];
}

class NowPlayingLoadingState extends NowPlayingState {
  @override
  List<Object> get props => [];
}

class NowPlayingSuccessState extends NowPlayingState {
  final MovieList movieList;

  NowPlayingSuccessState(this.movieList);

  @override
  List<Object> get props => [];

}class NowPlayingErrorState extends NowPlayingState {
  final String message;

  NowPlayingErrorState(this.message);
  @override
  List<Object> get props => [];
}
