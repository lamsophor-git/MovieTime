import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/constant/constant.dart';
import 'package:login_bloc/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:login_bloc/presentation/pages/main_page.dart';
import 'package:login_bloc/presentation/widgets/splash_widget.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.primaryColor,
      body: BlocBuilder<SplashBloc,SplashState>(
        builder: (cntext,state){
          if((state is SplashInitial) ||(state is SplashLoadingState)){
            return SplashWiget();
          }else if( state is SplashSuccessState){
            return MainPage();
          }else{
            return Container();
          }
        },
      )
    );
  }
}
