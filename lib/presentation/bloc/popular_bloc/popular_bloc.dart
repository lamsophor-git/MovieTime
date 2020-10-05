import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_bloc/data/models/movie.dart';
import 'package:login_bloc/data/repositories/movie_repo.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final MovieListRepo movieListRepo;
  PopularBloc(this.movieListRepo) : super(PopularInitial());

  @override
  Stream<PopularState> mapEventToState(
    PopularEvent event,
  ) async* {
    try{
      if(event is GetPopularEvent){
        yield PopularLoadingState();
        MovieList movieList = await movieListRepo.getPopular();
        yield PopularSuccessState(movieList);
      }

    }catch(e){
      yield PopularErrorState('Can not load popular');
    }
  }
}
