import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_cart_response_entity.dart';

import '../../Entities/failures_entity.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getCart();
}
