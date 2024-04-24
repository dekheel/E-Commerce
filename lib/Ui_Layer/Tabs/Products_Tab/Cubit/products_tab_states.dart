import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';

abstract class ProductTabStates {}

class ProductTabInitialStates extends ProductTabStates {}

class ProductLoadingStates extends ProductTabStates {
  String? loading;

  ProductLoadingStates({required this.loading});
}

class ProductErrorStates extends ProductTabStates {
  Failures failures;

  ProductErrorStates({required this.failures});
}

class ProductSuccessStates extends ProductTabStates {}
