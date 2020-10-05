import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_bloc/data/repositories/authentication_repo.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepo authenticationRepo;

  AuthenticationBloc(this.authenticationRepo)
      : super(AuthenticationInitialState());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationEventLogin) {
      try {
        yield AuthenticationLoadingState();
        String token = await authenticationRepo.createRequestToken();
        String tokenKey = await authenticationRepo.createSessionWithLogin(
          event.username,
          event.password,
          token,
        );
        String sessionId = await authenticationRepo.createSession(tokenKey);

        yield AuthenticationSuccessState(sessionId);
      } catch (e) {
        yield AuthenticationErrorState("Can't login");
      }
    }
    if(event is AuthenticationEventLogOut){

    }
  }
}
