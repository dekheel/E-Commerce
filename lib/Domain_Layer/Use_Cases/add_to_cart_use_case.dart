import 'package:dartz/dartz.dart';

import '../Entities/add_cart_response_entity.dart';
import '../Entities/failures_entity.dart';
import '../Repository/Repository/home_tab_repository.dart';

class AddToCartUseCase {
  HomeTabRepository homeTabRepository;

  AddToCartUseCase({required this.homeTabRepository});

  Future<Either<Failures, AddCartResponseEntity>> addProductToCart(
      String productId) {
    return homeTabRepository.addProductToCart(productId);
  }
}
