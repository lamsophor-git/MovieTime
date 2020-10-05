import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/constant/constant.dart';
import 'package:login_bloc/presentation/bloc/splash_bloc/splash_bloc.dart';
class SplashWiget extends StatefulWidget {
  @override
  _SplashWigetState createState() => _SplashWigetState();
}

class _SplashWigetState extends State<SplashWiget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashBloc>(context).add(AfterSplashEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:AppColor.primaryColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset('assets/images/kino.gif',width: 300,fit: BoxFit.cover,),
                ),
              ),
              Text('Movie Time',style: TextStyle(fontSize: 40,color:Colors.white),)
            ],
          ),
        )
    );
  }
}
