import 'package:dartz/dartz.dart';

import '../../Entities/category_brand_response_entity.dart';
import '../../Entities/failures_entity.dart';

abstract class HomeTabRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();
}
