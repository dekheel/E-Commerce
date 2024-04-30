import 'package:e_commerce/Data_Layer/Api/api_manager.dart';
import 'package:e_commerce/Data_Layer/Repository/Data_Source/cart_data_source_impl.dart';
import 'package:e_commerce/Data_Layer/Repository/Data_Source/favorite_data_source_impl.dart';
import 'package:e_commerce/Data_Layer/Repository/Data_Source/home_tab_remote_data_source_impl.dart';
import 'package:e_commerce/Data_Layer/Repository/Repository/auth_repository_impl.dart';
import 'package:e_commerce/Data_Layer/Repository/Repository/cart_repository_impl.dart';
import 'package:e_commerce/Data_Layer/Repository/Repository/favorite_repository_impl.dart';
import 'package:e_commerce/Data_Layer/Repository/Repository/home_tab_repository_impl.dart';
import 'package:e_commerce/Data_Layer/Repository/Repository/user_repository_impl.dart';
import 'package:e_commerce/Domain_Layer/Repository/Repository/auth_repository.dart';
import 'package:e_commerce/Domain_Layer/Use_Cases/add_favorite_use_case.dart';
import 'package:e_commerce/Domain_Layer/Use_Cases/add_to_cart_use_case.dart';
import 'package:e_commerce/Domain_Layer/Use_Cases/get_all_categories_use_case.dart';
import 'package:e_commerce/Domain_Layer/Use_Cases/get_favorite_product_use_case.dart';
import 'package:e_commerce/Domain_Layer/Use_Cases/get_user_use_case.dart';

import '../Data_Layer/Repository/Data_Source/auth_remote_data_source_imp.dart';
import '../Data_Layer/Repository/Data_Source/user_remote_data_source_impl.dart';
import 'Repository/Data_Source/auth_remote_data_source.dart';
import 'Repository/Data_Source/cart_remote_data_source.dart';
import 'Repository/Data_Source/favorite_data_source.dart';
import 'Repository/Data_Source/home_tab_remote_data_source.dart';
import 'Repository/Data_Source/user_data_source.dart';
import 'Repository/Repository/cart_repository.dart';
import 'Repository/Repository/favorite_repository.dart';
import 'Repository/Repository/home_tab_repository.dart';
import 'Repository/Repository/user_repository.dart';
import 'Use_Cases/auth_use_case.dart';
import 'Use_Cases/delete_cart_item_use_case.dart';
import 'Use_Cases/delete_favorite_use_case.dart';
import 'Use_Cases/get_all_brands_use_case.dart';
import 'Use_Cases/get_all_products_use_case.dart';
import 'Use_Cases/get_cart_use_case.dart';
import 'Use_Cases/update_cart_item_use_case.dart';

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

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(homeTabRepository: injectHomeTabRepository());
}

GetCartUseCase injectGetCartUseCase() {
  return GetCartUseCase(cartRepository: injectCartRepository());
}

CartRepository injectCartRepository() {
  return CartRepositoryImpl(cartRemoteDataSource: injectCartRemoteDataSource());
}

CartRemoteDataSource injectCartRemoteDataSource() {
  return CartRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

DeleteCartItemUseCase injectDeleteCartItemUseCase() {
  return DeleteCartItemUseCase(cartRepository: injectCartRepository());
}

UpdateCartItemUseCase injectUpdateCartItemUseCase() {
  return UpdateCartItemUseCase(cartRepository: injectCartRepository());
}

GetUserUseCase injectGetUserUseCase() {
  return GetUserUseCase(userRepository: injectUserRepository());
}

UserRepository injectUserRepository() {
  return UserRepositoryImpl(userRemoteDataSource: injectUserRemoteDataSource());
}

UserRemoteDataSource injectUserRemoteDataSource() {
  return UserRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

AddFavoriteUseCase injectAddRemoveFavoriteUseCase() {
  return AddFavoriteUseCase(favoriteReposiroty: injectFavoriteReposiroty());
}

RemoveFavoriteUseCase injectRemoveFavoriteUseCase() {
  return RemoveFavoriteUseCase(favoriteReposiroty: injectFavoriteReposiroty());
}

FavoriteReposiroty injectFavoriteReposiroty() {
  return FavoriteRepositoryImpl(favoriteDataSource: injectFavoriteDataSource());
}

FavoriteDataSource injectFavoriteDataSource() {
  return FavoriteDataSopurceImpl(apiManager: ApiManager.getInstance());
}

GetFavoriteProductsUseCase injectGetFavoriteUseCase() {
  return GetFavoriteProductsUseCase(
      favoriteReposiroty: injectFavoriteReposiroty());
}
