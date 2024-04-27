import 'package:bloc/bloc.dart';
import 'package:e_commerce/Domain_Layer/Use_Cases/get_cart_use_case.dart';

import '../../../Domain_Layer/Entities/get_cart_response_entity.dart';
import 'cart_item_states.dart';

class CartItemsScreenViewModel extends Cubit<CartStates> {
  CartItemsScreenViewModel({required this.getCartUseCase})
      : super(CartInitialState());

  List<GetProductsEntity> cartProducts = [];

  GetCartUseCase getCartUseCase;

  void getCartResponse() async {
    emit(CartLoadingState(message: "Loading....."));

    var either = await getCartUseCase.getCartInvoke();

    either.fold((l) {
      emit(CartErrorState(message: l.errorMessage));
    }, (response) {
      cartProducts = response.data?.products ?? [];
      emit(CartSuccessState(cartResponse: response));
    });
  }
}
