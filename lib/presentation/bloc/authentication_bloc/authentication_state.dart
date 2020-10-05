part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitialState extends AuthenticationState {
  @override
  List<Object> get props => [];
}
class AuthenticationLoadingState extends AuthenticationState{
  @override
  List<Object> get props => [];
}
class AuthenticationSuccessState extends AuthenticationState{
  final String sessionId;
  AuthenticationSuccessState(this.sessionId);

  @override
  List<Object> get props => [];
}
class AuthenticationErrorState extends AuthenticationState{
  final String message;
  AuthenticationErrorState(this.message);
  @override
  List<Object> get props => [];
}

