import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain_Layer/Repository/Repository/home_tab_repository.dart';

import '../Entities/category_brand_response_entity.dart';
import '../Entities/failures_entity.dart';

class GetAllBrandsUseCase {
  HomeTabRepository homeTabRepository;

  GetAllBrandsUseCase({required this.homeTabRepository});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrandsInvoke() {
    return homeTabRepository.getAllBrands();
  }
}
