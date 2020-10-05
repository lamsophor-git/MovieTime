import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/data/data_sources/remote/authentication_remote_data_source.dart';
import 'package:login_bloc/data/data_sources/remote/movie_detail_remote_data_source.dart';
import 'package:login_bloc/data/data_sources/remote/movies_remote_data_source.dart';
import 'package:login_bloc/data/repositories/authentication_repo.dart';
import 'package:login_bloc/data/repositories/movie_detail_repo.dart';
import 'package:login_bloc/data/repositories/movie_repo.dart';
import 'package:login_bloc/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:login_bloc/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:login_bloc/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:login_bloc/presentation/bloc/nowplaying_bloc/now_playing_bloc.dart';
import 'package:login_bloc/presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:login_bloc/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:login_bloc/presentation/bloc/toprate_bloc/top_rate_bloc.dart';
import 'package:login_bloc/presentation/pages/login/login_page.dart';
import 'package:login_bloc/presentation/pages/movie_detail_page.dart';
import 'package:login_bloc/presentation/pages/splash_page.dart';
import 'presentation/pages/main_page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AuthenticationRemoteDataSource remoteDataSource = AuthenticationRemoteDataSource();
    AuthenticationRepo _authenticationRepo = AuthenticationRepo(remoteDataSource);
    MovieRemoteDataSource movieRemoteDataSource = MovieRemoteDataSource();
    MovieListRepo movieListRepo = MovieListRepo(movieRemoteDataSource);
    MovieDetailRemoteDataSource movieDetailRemoteDataSource = MovieDetailRemoteDataSource();
    MovieDetailRepo movieDetailRepo = MovieDetailRepo(movieDetailRemoteDataSource);
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) =>  AuthenticationBloc(_authenticationRepo),
        ),
        BlocProvider<BottomNavigationBloc>(
          create: (context) => BottomNavigationBloc()..add(HomeEvent()),
        ),
        BlocProvider<NowPlayingBloc>(
          create: (context) => NowPlayingBloc(movieListRepo),
        ),
        BlocProvider<TopRateBloc>(
          create: (context) => TopRateBloc(movieListRepo),
        ),
        BlocProvider<PopularBloc>(
          create: (context) => PopularBloc(movieListRepo),
        ),
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(),
        ),
        BlocProvider<MovieDetailBloc>(
          create: (context) => MovieDetailBloc(movieDetailRepo),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
          home:SplashPage(),
        debugShowCheckedModeBanner: false,
        routes:{
          MovieDetailPage.routeName:(context) => MovieDetailPage(),
        },
      ),
    );
  }
}
