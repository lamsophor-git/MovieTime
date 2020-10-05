import 'package:login_bloc/constant/constant.dart';
import 'package:login_bloc/data/models/account.dart';
import 'package:http/http.dart' as http;
abstract class IAccountRemoteDataSource{
  Future<Account> getAccountDetail( String sessionId) ;
}

class AccountRemoteDataSource implements IAccountRemoteDataSource{
  @override
  Future<Account> getAccountDetail(String sessionId) async {
    http.Response response = await http.get('$API_URL/account?api_key=$API_KEY&session_id=$sessionId');
    if(response.statusCode == 200){
      return Account.fromJson(response.body);
    }else{
      throw Exception("Error");
    }
  }
  
  
}