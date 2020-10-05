import 'package:login_bloc/data/data_sources/remote/account_remote_data_source.dart';
import 'package:login_bloc/data/models/account.dart';
import 'package:login_bloc/domain/repositories/i_account_repo.dart';

class AccountRepo implements IAccountRepo{
  AccountRemoteDataSource _accountRemoteDataSource;
  @override
  Future<Account> getAccountDetail(String sessionId) {
    return _accountRemoteDataSource.getAccountDetail(sessionId);
  }

}