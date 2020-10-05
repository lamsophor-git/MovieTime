import 'package:login_bloc/constant/constant.dart';
import 'package:login_bloc/data/models/movie.dart';
import 'package:http/http.dart' as http;
abstract class IMovieRemoteDataSource{
  Future<MovieList> getNowPlaying();
  Future<MovieList> getPopular();
  Future<MovieList> getTopRate();
  Future<MovieList> getUpComing();

}

class MovieRemoteDataSource implements IMovieRemoteDataSource{
  @override
  Future<MovieList> getNowPlaying() async{
    http.Response response = await http.get('$API_URL/movie/now_playing?api_key=$API_KEY&language=en-US&page=3');
    if(response.statusCode == 200){
      return MovieList.fromJson(response.body);
    }
    else{
      throw Exception("Error");
    }
  }

  @override
  Future<MovieList> getPopular() async{
    http.Response response = await http.get('$API_URL/movie/popular?api_key=$API_KEY&language=en-US&page=1');
    if(response.statusCode == 200){
      return MovieList.fromJson(response.body);
    }
    else{
      throw Exception("Error");
    }

  }

  @override
  Future<MovieList> getTopRate() async{
    http.Response response = await http.get('$API_URL/movie/top_rated?api_key=$API_KEY&language=en-US&page=2');
    if(response.statusCode == 200){
      return MovieList.fromJson(response.body);
    }
    else{
      throw Exception("Error");
    }

  }

  @override
  Future<MovieList> getUpComing() async{
    http.Response response = await http.get('$API_URL/movie/upcoming?api_key=$API_KEY&language=en-US&page=1');
    if(response.statusCode == 200){
      return MovieList.fromJson(response.body);
    }
    else{
      throw Exception("Error");
    }

  }

}