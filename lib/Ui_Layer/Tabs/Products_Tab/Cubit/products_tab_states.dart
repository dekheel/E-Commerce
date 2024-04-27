import 'package:e_commerce/Domain_Layer/Entities/failures_entity.dart';

import '../../../../Domain_Layer/Entities/add_cart_response_entity.dart';

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

class AddToCartLoadingStates extends ProductTabStates {
  String? loading;

  AddToCartLoadingStates({required this.loading});
}

class AddToCartErrorStates extends ProductTabStates {
  Failures failures;

  AddToCartErrorStates({required this.failures});
}

class AddToCartSuccessStates extends ProductTabStates {
  AddCartResponseEntity addCartResponseEntity;

  AddToCartSuccessStates({required this.addCartResponseEntity});
}
