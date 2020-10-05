import 'package:flutter/material.dart';
import 'package:login_bloc/constant/constant.dart';
import 'package:login_bloc/presentation/pages/drawer_page.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          centerTitle: true,
            backgroundColor: AppColor.primaryColor,
            elevation: 0,
            title: Text('Account')),
        drawer: DrawerPage(),
        body: Container());
  }
}
