import 'package:login_bloc/data/models/movie.dart';

abstract class IMovieListRepo{
  Future<MovieList> getNowPlaying();
  Future<MovieList> getPopular();
  Future<MovieList> getTopRate();
  Future<MovieList> getUpComing();
}