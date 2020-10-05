import 'package:flutter/material.dart';
import 'package:login_bloc/constant/constant.dart';
import 'package:login_bloc/data/models/movie.dart';
import '';
class MovieCarosel extends StatelessWidget {
  final Result result;
  MovieCarosel(this.result);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Container(
          child: Image.network('$IMAGE_URL${result.backdropPath}',height:400,width: double.infinity,fit:BoxFit.cover,alignment: Alignment.topCenter,),
        ),
        Positioned(
          top: 70,
          right: 180,
          child: IconButton(
            onPressed: (){},
            icon: Icon(Icons.play_circle_outline,color: Colors.white,size: 60,),
          ),
        ),
        Positioned(
          bottom: 60,
          child: Image.network('https://weareosd.org/wp-content/uploads/2018/08/2018-top-rated-awards-badge-hi-res.png',height: 80,width: 80,),
        ),
        Positioned(
          right:0,
          bottom: 0,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent,AppColor.primaryColor],
                begin:Alignment.topCenter,
                end: Alignment.bottomCenter

              )
            ),
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Text('${result.title}',style:TextStyle(color: Colors.white,fontSize: 30,),overflow: TextOverflow.ellipsis,),
          ),
        ),

       ]
    );
  }
}
