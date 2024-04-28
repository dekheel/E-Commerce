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

class DeleteCartItemLoadingState extends CartStates {
  String? message;

  DeleteCartItemLoadingState({required this.message});
}

class DeleteCartItemErrorState extends CartStates {
  String? message;

  DeleteCartItemErrorState({required this.message});
}

class DeleteCartItemSuccessState extends CartStates {
  GetCartResponseEntity? cartResponse;

  DeleteCartItemSuccessState({required this.cartResponse});
}

class UpdateCartItemLoadingState extends CartStates {
  String? message;

  UpdateCartItemLoadingState({required this.message});
}

class UpdateCartItemErrorState extends CartStates {
  String? message;

  UpdateCartItemErrorState({required this.message});
}

class UpdateCartItemSuccessState extends CartStates {
  GetCartResponseEntity? cartResponse;

  UpdateCartItemSuccessState({required this.cartResponse});
}
