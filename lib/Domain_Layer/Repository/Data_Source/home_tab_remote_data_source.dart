import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/add_cart_response_entity.dart';

import '../../Entities/category_brand_response_entity.dart';
import '../../Entities/failures_entity.dart';
import '../../Entities/product_response_entity.dart';

abstract class HomeTabRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();

  Future<Either<Failures, AddCartResponseEntity>> addProductToCart(
      String productId);
}
