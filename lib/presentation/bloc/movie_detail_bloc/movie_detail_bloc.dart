import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_bloc/data/models/movie_detail.dart';
import 'package:login_bloc/data/repositories/movie_detail_repo.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieDetailRepo movieDetailRepo;
  MovieDetailBloc(this.movieDetailRepo) : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    try{
      if(event is GetMovieDetailEvent){
        yield MovieDetailLoadingState();
        MovieDetail movieDetail = await movieDetailRepo.getMovieDetail(event.movieId);
        yield MovieDetailSuccessState( movieDetail);
      }
    }catch(e){
      yield MovieDetailErroeState('Can not get detail movie');
    }
  }
}
