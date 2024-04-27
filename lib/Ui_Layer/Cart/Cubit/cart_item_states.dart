import 'package:e_commerce/Domain_Layer/Entities/get_cart_response_entity.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {
  String? message;

  CartLoadingState({required this.message});
}

class CartErrorState extends CartStates {
  String? message;

  CartErrorState({required this.message});
}

class CartSuccessState extends CartStates {
  GetCartResponseEntity? cartResponse;

  CartSuccessState({required this.cartResponse});
}
