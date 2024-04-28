import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_cart_response_entity.dart';
import 'package:e_commerce/Domain_Layer/Repository/Repository/cart_repository.dart';

import '../Entities/failures_entity.dart';

class UpdateCartItemUseCase {
  CartRepository cartRepository;

  UpdateCartItemUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> updateCartItem(
      String productId, int count) {
    return cartRepository.updateCartItem(productId, count);
  }
}
