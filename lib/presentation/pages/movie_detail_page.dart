import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/constant/constant.dart';
import 'package:login_bloc/data/models/movie.dart';
import 'package:login_bloc/data/models/movie_detail.dart';
import 'package:login_bloc/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:intl/intl.dart';

class MovieDetailPage extends StatelessWidget {
  static const routeName = '/movie-detail';

  @override
  Widget build(BuildContext context) {
    final int movieId = ModalRoute.of(context).settings.arguments as int;
    BlocProvider.of<MovieDetailBloc>(context).add(GetMovieDetailEvent(movieId));
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MovieDetailSuccessState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                              '$IMAGE_URL${state.movieDetail.backdropPath}',height: 204,width: double.infinity,fit:BoxFit.cover),
                        ),
                        Positioned(
                          child: Container(
                            width: double.infinity,
                            height: 205,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.black54,
                                  AppColor.primaryColor
                                ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: InkWell(
                              onTap: () {},
                              child: Chip(
                                backgroundColor: Colors.white,
                                label: Container(
                                    width: 100,
                                    child: Row(children: [
                                      Icon(Icons.playlist_play),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Trailer')
                                    ])),
                              ),
                            ),
                          ),
                        ),
                        // Positioned(
                        //
                        // )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 150,
                      child: Row(
                        children: [
                          Container(
                            width: 130,
                            alignment: Alignment.topCenter,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                '$IMAGE_URL${state.movieDetail.posterPath}',
                                height: 150,
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                    width: 200,
                                        child: Text(
                                      state.movieDetail.title,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                SizedBox(height: 20,),
                                Container(
                                  width: 200,
                                   child:Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Text(DateFormat().add_yMMMMd().format(state.movieDetail.releaseDate),style: TextStyle(fontSize: 16, color: Colors.white),),
                                     ],
                                   ),
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.yellow,),
                                      Text(state.movieDetail.voteAverage.toString(),style: TextStyle(fontSize: 16, color: Colors.white)),
                                      SizedBox(width: 20,),
                                      Icon(Icons.switch_video,color:Colors.white,),
                                      Text(state.movieDetail.voteCount.toString(),style: TextStyle(fontSize: 16, color: Colors.white))
                                    ],
                                  )
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      height: 50,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                          ],
                        ),
                      ),
                    ),
                    Container(

                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
