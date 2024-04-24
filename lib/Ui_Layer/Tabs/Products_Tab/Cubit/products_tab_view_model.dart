import 'package:e_commerce/Domain_Layer/Entities/product_response_entity.dart';
import 'package:e_commerce/Domain_Layer/Use_Cases/get_all_products_use_case.dart';
import 'package:e_commerce/Ui_Layer/Tabs/Products_Tab/Cubit/products_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTabViewModel extends Cubit<ProductTabStates> {
  GetAllProductsUseCase productsUseCase;

  ProductTabViewModel({required this.productsUseCase})
      : super(ProductTabInitialStates());
  List<ProductEntity> productResponseEntities = [];

  void getAllProducts() async {
    emit(ProductLoadingStates(loading: "loading...."));
    var categoriesEither = await productsUseCase.getAllProductsInvoke();

    categoriesEither.fold(
        (failure) => emit(ProductErrorStates(failures: failure)), (response) {
      productResponseEntities = response.data ?? [];
      emit(ProductSuccessStates());
    });
  }
}
