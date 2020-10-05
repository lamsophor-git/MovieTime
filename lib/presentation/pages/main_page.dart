import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/constant/constant.dart';
import 'package:login_bloc/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:login_bloc/presentation/pages/account_page.dart';
import 'package:login_bloc/presentation/pages/home_page.dart';
import 'package:login_bloc/presentation/pages/watch_list_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> page =[
      HomePage(),
      WatchListPage(),
      AccountPage(),
  ];
  final PageStorageBucket bucket = new PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc,BottomNavigationState>(
      builder: (context,state){
        if(state is HomeState){
          return _buildActivePage(currentIndex:state.index,);
        }
        if(state is WatchListState){
          return _buildActivePage(currentIndex:state.index,);
        }
        if(state is AccountState){
          return _buildActivePage(currentIndex:state.index,);
        }

        return Container();
      },
    );
  }

  Scaffold _buildActivePage({int currentIndex,String title}){
    return Scaffold(
      body: PageStorage(bucket: bucket, child: page[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.primaryColor,
        onTap: (index){
          if(index == 0){
            return BlocProvider.of<BottomNavigationBloc>(context).add(HomeEvent());
          }
          if(index == 1){
            return BlocProvider.of<BottomNavigationBloc>(context).add(WatchListEvent());
          }
          if(index == 2){
            return BlocProvider.of<BottomNavigationBloc>(context).add(AccountEvent());
          }
        },
        items: [
          _buildTabBarItem(icon:Icon(Icons.home),title:'Home'),
          _buildTabBarItem(icon:Icon(Icons.watch),title:'WatchList'),
          _buildTabBarItem(icon:Icon(Icons.person_pin),title:'Account'),

        ],

      ),
    );

  }
  _buildTabBarItem({final Widget icon,final String title}){
    return BottomNavigationBarItem(icon:icon,title:Text(title));
  }
}
