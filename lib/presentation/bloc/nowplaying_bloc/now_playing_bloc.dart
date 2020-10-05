import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_bloc/data/models/movie.dart';
import 'package:login_bloc/data/repositories/movie_repo.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final MovieListRepo movieListRepo;
  NowPlayingBloc(this.movieListRepo) : super(NowPlayingInitial());

  @override
  Stream<NowPlayingState> mapEventToState(
    NowPlayingEvent event,
  ) async* {
    if(event is GetNowPlayingEvent){
      try{
        yield NowPlayingLoadingState();
        MovieList movieList = await movieListRepo.getNowPlaying();

        yield NowPlayingSuccessState(movieList);
      }catch(e){
        yield NowPlayingErrorState("Can not load movies");
      }

    }
  }
}
