import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_cart_response_entity.dart';
import 'package:e_commerce/Domain_Layer/Repository/Repository/cart_repository.dart';

import '../Entities/failures_entity.dart';

class DeleteCartItemUseCase {
  CartRepository cartRepository;

  DeleteCartItemUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> deleteCartItem(
      String productId) {
    return cartRepository.deleteCartItem(productId);
  }
}
