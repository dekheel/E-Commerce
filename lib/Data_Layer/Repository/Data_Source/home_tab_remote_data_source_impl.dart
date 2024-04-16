import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data_Layer/Api/api_manager.dart';

import 'package:e_commerce/Domain_Layer/Entities/category_brand_response_entity.dart';

import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';

import '../../../Domain_Layer/Repository/Data_Source/home_tab_remote_data_source.dart';

class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSource {
  ApiManager apiManager;

  HomeTabRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>>
      getAllCategories() async {
    var either = await apiManager.getAllCategories();
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    });
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async {
    var either = await apiManager.getAllBrands();
    return either.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    });
  }
}
