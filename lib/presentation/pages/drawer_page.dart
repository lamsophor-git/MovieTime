import 'package:flutter/material.dart';
import 'package:login_bloc/constant/constant.dart';
class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Scaffold(
          backgroundColor: AppColor.primaryColor,
          appBar:AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: AppColor.primaryColor,
            title:Row(
              children: [
                Image.network('https://seeklogo.com/images/M/movie-time-cinema-logo-8B5BE91828-seeklogo.com.png',height: 40,),
                Text('Movies & TV')
              ],
            ),
          ),
          body: Container(
            child: Column(
              children: [
                InkWell(
                  onTap: (){},
                  child: _buildListTile('Setting',Icon(Icons.settings,size: 20,color: Colors.white,),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: _buildListTile('Help & FeedBack',Icon(Icons.forum,size: 20,color: Colors.white,),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: _buildListTile('Log-Out',Icon(Icons.local_airport,size: 20,color: Colors.white,),
                  ),
                ),

              ],
            ),
          ),
        ),

    );
  }
    Widget _buildListTile( String title,Widget icon){
          return ListTile(
            leading: icon,
            title: Text(title,style: TextStyle(color: Colors.white),),
            trailing: Icon(Icons.keyboard_arrow_right),
          );
    }
}
