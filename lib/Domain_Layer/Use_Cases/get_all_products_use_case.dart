import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Repository/Repository/home_tab_repository.dart';

import '../Entities/failures_entity.dart';
import '../Entities/product_response_entity.dart';

class GetAllProductsUseCase {
  HomeTabRepository homeTabRepository;

  GetAllProductsUseCase({required this.homeTabRepository});

  Future<Either<Failures, ProductResponseEntity>> getAllProductsInvoke() {
    return homeTabRepository.getAllProducts();
  }
}
