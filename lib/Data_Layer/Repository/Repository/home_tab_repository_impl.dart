import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/add_cart_response_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/category_brand_response_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/product_response_entity.dart';
import 'package:e_commerce/Domain_Layer/Repository/Data_Source/home_tab_remote_data_source.dart';
import 'package:e_commerce/Domain_Layer/Repository/Repository/home_tab_repository.dart';

class HomeTabRepositoryImpl implements HomeTabRepository {
  HomeTabRemoteDataSource homeTabRemoteDataSource;

  HomeTabRepositoryImpl({required this.homeTabRemoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories() {
    return homeTabRemoteDataSource.getAllCategories();
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() {
    return homeTabRemoteDataSource.getAllBrands();
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() {
    return homeTabRemoteDataSource.getAllProducts();
  }

  @override
  Future<Either<Failures, AddCartResponseEntity>> addProductToCart(
      String productId) {
    return homeTabRemoteDataSource.addProductToCart(productId);
  }
}
