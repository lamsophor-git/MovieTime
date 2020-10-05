import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/constant/constant.dart';
import 'file:///C:/Users/User/Desktop/BloC/login_bloc/lib/presentation/pages/drawer_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:login_bloc/presentation/bloc/nowplaying_bloc/now_playing_bloc.dart';
import 'package:login_bloc/presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:login_bloc/presentation/bloc/toprate_bloc/top_rate_bloc.dart';
import 'package:login_bloc/presentation/widgets/movie_item.dart';
import 'package:login_bloc/presentation/widgets/movie_item_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NowPlayingBloc>(context).add(GetNowPlayingEvent());
    BlocProvider.of<TopRateBloc>(context).add(GetTopRateEvent());
    BlocProvider.of<PopularBloc>(context).add(GetPopularEvent());
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Movies & TV'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
      backgroundColor: AppColor.primaryColor,
      drawer: DrawerPage(),
      body: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: InkWell(
                  onTap: (){},
                  child: _buildListleMoive(icon:Icon(Icons.movie,),title:'Latest Movies',icons:Icon(Icons.keyboard_arrow_right)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 250,
                child: BlocBuilder<TopRateBloc,TopRateState>(
                  builder: (context,state){
                    if(state is TopRateLoadingState){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(state is TopRateSuccessState){
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.movieList.results.length,
                          itemBuilder:(context,index){
                            return MovieItem(state.movieList.results[index]);
                          }
                      );
                    }
                    if(state is TopRateErrorState){
                      return Center(child: Text(state.message),);
                    }else{
                      return Container();
                    }
                  },
                ),
              ),
            Container(
            width: double.infinity,
            height: 200,
              child: BlocBuilder<NowPlayingBloc,NowPlayingState>(
                  builder: (context,state){
                    if(state is NowPlayingLoadingState){
                      return Center(
                        child:  CircularProgressIndicator(),
                      );
                    }
                    if(state is NowPlayingSuccessState){
                      return CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 400,
                          aspectRatio:1,
                          viewportFraction:1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 2),
                          autoPlayAnimationDuration: Duration(milliseconds: 600),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        itemCount: state.movieList.results.length,
                        itemBuilder: (BuildContext context, int itemIndex) =>
                            MovieCarosel(state.movieList.results[itemIndex]),
                      );
                    }
                    if(state is NowPlayingErrorState){
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    else{
                      return Container();
                    }
                  },
              ),
              ),
              Container(
                child: InkWell(
                  onTap: (){},
                  child: _buildListleMoive(icon:Icon(Icons.movie,),title:'Now Playing Movies',icons:Icon(Icons.keyboard_arrow_right)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 250,
                child: BlocBuilder<NowPlayingBloc,NowPlayingState>(
                  builder: (context,state){
                    if(state is NowPlayingLoadingState){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(state is NowPlayingSuccessState){
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.movieList.results.length,
                          itemBuilder:(context,index){
                            return MovieItem(state.movieList.results[index]);
                          }
                      );
                    }
                    if(state is NowPlayingErrorState){
                      return Center(child: Text(state.message),);
                    }else{
                      return Container();
                    }
                  },
                ),
              ),
              Container(
                child: InkWell(
                  onTap: (){},
                  child: _buildListleMoive(icon:Icon(Icons.movie,),title:'Top Rate Movies',icons:Icon(Icons.keyboard_arrow_right)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 250,
                child: BlocBuilder<TopRateBloc,TopRateState>(
                  builder: (context,state){
                    if(state is TopRateLoadingState){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(state is TopRateSuccessState){
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.movieList.results.length,
                          itemBuilder:(context,index){
                            return MovieItem(state.movieList.results[index]);
                          }
                      );
                    }
                    if(state is TopRateErrorState){
                      return Center(child: Text(state.message),);
                    }else{
                      return Container();
                    }
                  },
                ),
              ),
              Container(
                child: InkWell(
                  onTap: (){},
                  child: _buildListleMoive(icon:Icon(Icons.movie,),title:'Popular Movies',icons:Icon(Icons.keyboard_arrow_right)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 250,
                child: BlocBuilder<PopularBloc,PopularState>(
                  builder: (context,state){
                    if(state is PopularLoadingState){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(state is PopularSuccessState){
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.movieList.results.length,
                          itemBuilder:(context,index){
                            return MovieItem(state.movieList.results[index]);
                          }
                      );
                    }
                    if(state is PopularErrorState){
                      return Center(child: Text(state.message),);
                    }else{
                      return Container();
                    }
                  },
                ),
              ),
            ]
        ),
      ),
    );
  }
  Widget _buildListleMoive({Widget icon,String title,Widget icons}){
    return ListTile(
      title:Text(title,style: TextStyle(color: Colors.white),),
      trailing: icons,
    );
  }
}
