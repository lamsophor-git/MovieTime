import 'package:login_bloc/constant/constant.dart';
import 'package:login_bloc/data/models/movie_detail.dart';
import 'package:http/http.dart' as http;
abstract class IMovieDetailRemoteDataSource{
  Future<MovieDetail> getMovieDetail(int movieId);
}

class MovieDetailRemoteDataSource implements IMovieDetailRemoteDataSource{
  @override
  Future<MovieDetail> getMovieDetail(int movieId) async{
      http.Response response = await http.get('$API_URL/movie/$movieId?api_key=$API_KEY&language=en-US');
      if(response.statusCode == 200){
        return MovieDetail.fromJson(response.body);
      }
      else{
        throw Exception("Error");
      }
  }

  
}
