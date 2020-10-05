import 'package:login_bloc/data/models/movie_detail.dart';

abstract class IMovieDetailRepo{
  Future<MovieDetail> getMovieDetail(int movieId);
}