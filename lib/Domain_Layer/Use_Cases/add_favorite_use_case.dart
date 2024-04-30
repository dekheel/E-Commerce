import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/add_remove_product_favorite_entity.dart';
import 'package:e_commerce/Domain_Layer/Repository/Repository/favorite_repository.dart';

import '../Entities/failures_entity.dart';

class AddFavoriteUseCase {
  FavoriteReposiroty favoriteReposiroty;

  AddFavoriteUseCase({required this.favoriteReposiroty});

  Future<Either<Failures, AddRemoveProductFavoriteEntity>> addFavorite(
      String productId) {
    return favoriteReposiroty.addFavorite(productId);
  }
}
