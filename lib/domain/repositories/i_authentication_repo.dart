abstract class IAuthenticationRepo{
  Future<String> createRequestToken();
  Future<String> createSessionWithLogin(String username,String password,String tokenKey) ;
  Future<String> createSession( String tokenKey);
  Future<bool> deleteSession( String sessionId);

}