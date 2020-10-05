import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:login_bloc/presentation/pages/login/account_page.dart';

class LoginPage extends StatelessWidget {
  AuthenticationBloc authBloc;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationErrorState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.message),
                ),
              );
            }
            if (state is AuthenticationSuccessState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountPage()));
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/a/ac/Oikya_Front_Logo.png',
                    height: 250,
                  ),
                ),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Account'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
                ),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticationInitialState) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: FlatButton(
                          onPressed: () {
                            login();
                          },
                          child: Text('Login'),
                        ),
                      );
                    }
                    if (state is AuthenticationLoadingState) {
                      return CircularProgressIndicator();
                    }
                    if (state is AuthenticationSuccessState) {
                      return Text("success");
                    }
                    if (state is AuthenticationErrorState) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: FlatButton(
                          onPressed: () {
                            login();
                          },
                          child: Text('Login'),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ));
  }

  void login() {
    authBloc.add(AuthenticationEventLogin(
        usernameController.text, passwordController.text));
  }
}
