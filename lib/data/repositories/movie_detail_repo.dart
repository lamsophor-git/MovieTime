import 'package:login_bloc/data/data_sources/remote/movie_detail_remote_data_source.dart';
import 'package:login_bloc/data/data_sources/remote/movies_remote_data_source.dart';
import 'package:login_bloc/data/models/movie_detail.dart';
import 'package:login_bloc/domain/repositories/i_movie_detail_repo.dart';

class MovieDetailRepo implements IMovieDetailRepo{
  final MovieDetailRemoteDataSource movieDetailRemoteDataSource;

  MovieDetailRepo(this.movieDetailRemoteDataSource);
  @override
  Future<MovieDetail> getMovieDetail(int movieId) {
    return movieDetailRemoteDataSource.getMovieDetail(movieId);
  }

}