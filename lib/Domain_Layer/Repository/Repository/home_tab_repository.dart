import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';

import '../../Entities/category_brand_response_entity.dart';

abstract class HomeTabRepository {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();
}
