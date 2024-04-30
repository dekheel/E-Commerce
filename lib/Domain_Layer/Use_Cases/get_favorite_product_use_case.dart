import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_favorite_product_entity.dart';
import 'package:e_commerce/Domain_Layer/Repository/Repository/favorite_repository.dart';

import '../Entities/failures_entity.dart';

class GetFavoriteProductsUseCase {
  FavoriteReposiroty favoriteReposiroty;

  GetFavoriteProductsUseCase({required this.favoriteReposiroty});

  Future<Either<Failures, GetFavoriteProductEntity>> getFavoriteProduct() {
    return favoriteReposiroty.getFavoriteProduct();
  }
}
