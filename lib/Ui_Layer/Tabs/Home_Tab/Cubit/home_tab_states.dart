import 'package:e_commerce/Domain_Layer/Entities/category_brand_response_entity.dart';
import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';

abstract class HomeTabStates {}

class HomeTabInitialStates extends HomeTabStates {}

class GetAllCategoriesLoadingStates extends HomeTabStates {
  String? loading;

  GetAllCategoriesLoadingStates({required this.loading});
}

class GetAllCategoriesErrorStates extends HomeTabStates {
  Failures failures;

  GetAllCategoriesErrorStates({required this.failures});
}

class GetAllCategoriesSuccessStates extends HomeTabStates {}

class GetAllBrandsLoadingStates extends HomeTabStates {
  String? loading;

  GetAllBrandsLoadingStates({required this.loading});
}

class GetAllBrandsErrorStates extends HomeTabStates {
  Failures failures;

  GetAllBrandsErrorStates({required this.failures});
}

class GetAllBrandsSuccessStates extends HomeTabStates {}
