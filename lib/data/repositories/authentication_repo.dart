
import 'package:login_bloc/data/data_sources/remote/authentication_remote_data_source.dart';
import 'package:login_bloc/domain/repositories/i_authentication_repo.dart';

class AuthenticationRepo implements IAuthenticationRepo {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  AuthenticationRepo(this.authenticationRemoteDataSource);

  @override
  Future<String> createRequestToken() {
    return authenticationRemoteDataSource.createRequestToken();
  }

  @override
  Future<String> createSession(String tokenKey) {
    return authenticationRemoteDataSource.createSession(tokenKey);
  }

  @override
  Future<String> createSessionWithLogin(String username, String password,
      String tokenKey) {
    return authenticationRemoteDataSource.createSessionWithLogin(
        username, password, tokenKey);
  }

  @override
  Future<bool> deleteSession(String sessionId) {
    return authenticationRemoteDataSource.deleteSession(sessionId);
  }
}