import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_cart_response_entity.dart';
import 'package:e_commerce/Domain_Layer/Repository/Data_Source/cart_remote_data_source.dart';

import '../../../Domain_Layer/Repository/Repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() {
    // TODO: implement getCart
    return cartRemoteDataSource.getCart();
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteCartItem(
      String productId) {
    // TODO: implement getCart
    return cartRemoteDataSource.deleteCartItem(productId);
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCartItem(
      String productId, int count) {
    // TODO: implement updateCartItem
    return cartRemoteDataSource.updateCartItem(productId, count);
  }
}
