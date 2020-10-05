import 'package:flutter/material.dart';
class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Account'),
        actions: [
         FlatButton(
           onPressed: (){},
           child: Text("Log Out"),
         )
        ],
      ),
      body:Container(
        child: Column(
          children: [
            Text('Username :{}'),

            Text('Password:{}')
          ],
        ),
      )
    );
  }
}
