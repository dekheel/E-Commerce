import 'package:e_commerce/Data_Layer/Api/api_manager.dart';
import 'package:e_commerce/Data_Layer/Repository/Data_Source/home_tab_remote_data_source_impl.dart';
import 'package:e_commerce/Data_Layer/Repository/Repository/auth_repository_impl.dart';
import 'package:e_commerce/Data_Layer/Repository/Repository/home_tab_repository_impl.dart';
import 'package:e_commerce/Domain_Layer/Repository/Repository/auth_repository.dart';
import 'package:e_commerce/Domain_Layer/Use_Cases/get_all_categories_use_case.dart';
import '../Data_Layer/Repository/Data_Source/auth_remote_data_source_imp.dart';
import 'Repository/Data_Source/auth_remote_data_source.dart';
import 'Repository/Data_Source/home_tab_remote_data_source.dart';
import 'Repository/Repository/home_tab_repository.dart';
import 'Use_Cases/auth_use_case.dart';
import 'Use_Cases/get_all_brands_use_case.dart';
import 'Use_Cases/get_all_products_use_case.dart';

// for Authentication
AuthUseCase injectRegisterUseCase() {
  return AuthUseCase(authRepository: injectAuthRepository());
}

AuthUseCase injectLoginUseCase() {
  return AuthUseCase(authRepository: injectAuthRepository());
}

AuthRepository injectAuthRepository() {
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

// for Categories

GetAllCategoriesUseCase injectGetAllCategoriesUseCase() {
  return GetAllCategoriesUseCase(homeTabRepository: injectHomeTabRepository());
}

HomeTabRepository injectHomeTabRepository() {
  return HomeTabRepositoryImpl(
      homeTabRemoteDataSource: injecthomeTabRemoteDataSource());
}

HomeTabRemoteDataSource injecthomeTabRemoteDataSource() {
  return HomeTabRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

// for Brands

GetAllBrandsUseCase injectGetAllBrandsUseCase() {
  return GetAllBrandsUseCase(homeTabRepository: injectHomeTabRepository());
}

// for products
GetAllProductsUseCase injectGetAllProductsUseCase() {
  return GetAllProductsUseCase(homeTabRepository: injectHomeTabRepository());
}
