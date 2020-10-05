import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_bloc/data/models/movie.dart';
import 'package:login_bloc/data/repositories/movie_repo.dart';

part 'top_rate_event.dart';
part 'top_rate_state.dart';

class TopRateBloc extends Bloc<TopRateEvent, TopRateState> {
  final MovieListRepo movieListRepo;
  TopRateBloc(this.movieListRepo) : super(TopRateInitial());

  @override
  Stream<TopRateState> mapEventToState(
    TopRateEvent event,
  ) async* {
    try{
      if(event is GetTopRateEvent){
        yield TopRateLoadingState();
        MovieList movieList = await movieListRepo.getTopRate();
        yield TopRateSuccessState(movieList);
      }

    }catch(e){
      yield TopRateErrorState('Error Top Rate Movies');
    }

  }
}
