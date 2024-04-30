import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data_Layer/Api/api_manager.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_favorite_product_entity.dart';
import 'package:e_commerce/Domain_Layer/Repository/Data_Source/favorite_data_source.dart';

import '../../../Domain_Layer/Entities/add_remove_product_favorite_entity.dart';
import '../../../Domain_Layer/Entities/failures_entity.dart';

class FavoriteDataSopurceImpl implements FavoriteDataSource {
  ApiManager apiManager;

  FavoriteDataSopurceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AddRemoveProductFavoriteEntity>> addFavorite(
      String productId) async {
    var either = await apiManager.addRemoveFavorite(productId);

    return either.fold(
      (l) {
        return left(l);
      },
      (r) {
        return right(r);
      },
    );
  }

  Future<Either<Failures, AddRemoveProductFavoriteEntity>> removeFavorite(
      String productId) async {
    var either = await apiManager.removeFavorite(productId);

    return either.fold(
      (l) {
        return left(l);
      },
      (r) {
        return right(r);
      },
    );
  }

  @override
  Future<Either<Failures, GetFavoriteProductEntity>>
      getFavoriteProduct() async {
    // TODO: implement getFavoriteProduct
    var either = await apiManager.getFavoriteProduct();

    return either.fold(
      (l) {
        return left(l);
      },
      (r) {
        return right(r);
      },
    );
  }
}
