import 'package:flutter/material.dart';
import 'package:login_bloc/constant/constant.dart';
import 'package:login_bloc/presentation/pages/drawer_page.dart';

class WatchListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          centerTitle: true,
          elevation: 0,
          title: Text('WatchList'),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search),
          )
        ],
      ),
      drawer: DrawerPage(),
      body: Container(),
    );
  }
}
