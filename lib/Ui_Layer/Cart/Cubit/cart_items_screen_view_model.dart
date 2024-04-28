import 'package:e_commerce/Domain_Layer/Use_Cases/delete_cart_item_use_case.dart';
import 'package:e_commerce/Domain_Layer/Use_Cases/get_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Domain_Layer/Entities/get_cart_response_entity.dart';
import '../../../Domain_Layer/Use_Cases/update_cart_item_use_case.dart';
import 'cart_item_states.dart';

class CartItemsScreenViewModel extends Cubit<CartStates> {
  CartItemsScreenViewModel(
      {required this.getCartUseCase,
      required this.deleteCartItemUseCase,
      required this.updateCartItemUseCase})
      : super(CartInitialState());

  GetCartResponseEntity cartProducts = GetCartResponseEntity();

  GetCartUseCase getCartUseCase;
  DeleteCartItemUseCase deleteCartItemUseCase;
  UpdateCartItemUseCase updateCartItemUseCase;

  void getCartResponse() async {
    emit(CartLoadingState(message: "Loading....."));

    var either = await getCartUseCase.getCartInvoke();

    either.fold((l) {
      emit(CartErrorState(message: l.errorMessage));
    }, (response) {
      cartProducts = response;
      emit(CartSuccessState(cartResponse: response));
    });
  }

  static CartItemsScreenViewModel getInstance(context) =>
      BlocProvider.of(context);

  void deleteCartItemResponse(String productId) async {
    emit(DeleteCartItemLoadingState(message: "Loading....."));
    var either = await deleteCartItemUseCase.deleteCartItem(productId);
    either.fold((l) {
      emit(DeleteCartItemErrorState(message: l.errorMessage));
    }, (response) {
      cartProducts = response;
      emit(CartSuccessState(cartResponse: response));
    });
  }

  void updateCartItemResponse(String productId, int count) async {
    emit(UpdateCartItemLoadingState(message: "Loading....."));
    var either = await updateCartItemUseCase.updateCartItem(productId, count);
    either.fold((l) {
      // print(l.errorMessage);
      emit(UpdateCartItemErrorState(message: l.errorMessage));
    }, (response) {
      emit(UpdateCartItemSuccessState(cartResponse: response));

      cartProducts = response;
      emit(CartSuccessState(cartResponse: response));
    });
  }
}
