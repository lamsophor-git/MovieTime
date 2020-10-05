part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AuthenticationEventLogin extends AuthenticationEvent {
  final String username;
  final String password;

  AuthenticationEventLogin(this.username, this.password);

  @override
  List<Object> get props => [];
}

class AuthenticationEventCheckLogin extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationEventLogOut extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
