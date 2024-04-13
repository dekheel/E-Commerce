import 'package:e_commerce/Data_Layer/Api/api_manager.dart';
import 'package:e_commerce/Data_Layer/Repository/Repository/auth_repository_impl.dart';
import 'package:e_commerce/Domain_Layer/Repository/Repository/auth_repository.dart';
import 'package:e_commerce/Domain_Layer/Use_Cases/register_use_case.dart';
import '../Data_Layer/Repository/Data_Source/auth_remote_data_source_imp.dart';
import 'Repository/Data_Source/auth_remote_data_source.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}

AuthRepository injectAuthRepository() {
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
