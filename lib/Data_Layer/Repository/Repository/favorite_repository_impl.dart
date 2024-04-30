import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/add_remove_product_favorite_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_favorite_product_entity.dart';
import 'package:e_commerce/Domain_Layer/Repository/Repository/favorite_repository.dart';

import '../../../Domain_Layer/Repository/Data_Source/favorite_data_source.dart';

class FavoriteRepositoryImpl implements FavoriteReposiroty {
  FavoriteDataSource favoriteDataSource;

  FavoriteRepositoryImpl({required this.favoriteDataSource});

  @override
  Future<Either<Failures, AddRemoveProductFavoriteEntity>> addFavorite(
      String productId) {
    // TODO: implement addRemoveFavorite
    return favoriteDataSource.addFavorite(productId);
  }

  @override
  Future<Either<Failures, GetFavoriteProductEntity>> getFavoriteProduct() {
    // TODO: implement getFavoriteProduct
    return favoriteDataSource.getFavoriteProduct();
  }

  @override
  Future<Either<Failures, AddRemoveProductFavoriteEntity>> removeFavorite(
      String productId) {
    // TODO: implement removeFavorite
    // TODO: implement addRemoveFavorite
    return favoriteDataSource.removeFavorite(productId);
  }
}
