import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_cart_response_entity.dart';

abstract class CartRepository {
  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteCartItem(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateCartItem(
      String productId, int count);
}
