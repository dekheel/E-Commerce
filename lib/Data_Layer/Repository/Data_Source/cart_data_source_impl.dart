import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data_Layer/Api/api_manager.dart';
import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_cart_response_entity.dart';

import '../../../Domain_Layer/Repository/Data_Source/cart_remote_data_source.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async {
    var either = await apiManager.getCart();
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteCartItem(
      String productId) async {
    var either = await apiManager.deleteCartItem(productId);
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCartItem(
      String productId, int count) async {
    var either = await apiManager.updateCartItem(productId, count);
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    });
  }
}
