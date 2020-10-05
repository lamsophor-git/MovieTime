import 'package:login_bloc/data/models/account.dart';

abstract class IAccountRepo{
  Future<Account> getAccountDetail(String sessionId);
}