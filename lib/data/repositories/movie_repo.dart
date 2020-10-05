import 'package:login_bloc/data/data_sources/remote/movies_remote_data_source.dart';
import 'package:login_bloc/data/models/movie.dart';
import 'package:login_bloc/domain/repositories/i_movie_repo.dart';

class MovieListRepo implements IMovieListRepo{
  final IMovieRemoteDataSource _movieRemoteDataSource;

  MovieListRepo(this._movieRemoteDataSource);
  @override
  Future<MovieList> getNowPlaying() {
    return _movieRemoteDataSource.getNowPlaying();
  }

  @override
  Future<MovieList> getPopular() {
    return _movieRemoteDataSource.getPopular();
  }

  @override
  Future<MovieList> getTopRate() {
    return _movieRemoteDataSource.getTopRate();
  }

  @override
  Future<MovieList> getUpComing() {
    return _movieRemoteDataSource.getUpComing();
  }

}