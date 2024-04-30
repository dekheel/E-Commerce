import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/add_remove_product_favorite_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_favorite_product_entity.dart';

abstract class FavoriteReposiroty {
  Future<Either<Failures, AddRemoveProductFavoriteEntity>> addFavorite(
      String productId);

  Future<Either<Failures, AddRemoveProductFavoriteEntity>> removeFavorite(
      String productId);

  Future<Either<Failures, GetFavoriteProductEntity>> getFavoriteProduct();
}
