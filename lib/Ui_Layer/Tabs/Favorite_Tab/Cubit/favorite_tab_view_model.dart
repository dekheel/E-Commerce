import 'package:e_commerce/Domain_Layer/Use_Cases/add_favorite_use_case.dart';
import 'package:e_commerce/Domain_Layer/Use_Cases/get_favorite_product_use_case.dart';
import 'package:e_commerce/Ui_Layer/Tabs/Favorite_Tab/Cubit/favorite_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Domain_Layer/Entities/product_response_entity.dart';
import '../../../../Domain_Layer/Use_Cases/delete_favorite_use_case.dart';

class FavoriteTabViewModel extends Cubit<FavoriteStates> {
  FavoriteTabViewModel(
      {required this.addDeleteFavoriteUseCase,
      required this.getFavoriteProductsUseCase,
      required this.removeFavoriteUseCase})
      : super(FavoriteInitialState());

  List<ProductEntity>? favorites = [];
  AddFavoriteUseCase addDeleteFavoriteUseCase;

  RemoveFavoriteUseCase removeFavoriteUseCase;

  GetFavoriteProductsUseCase getFavoriteProductsUseCase;

  static FavoriteTabViewModel instance(context) => BlocProvider.of(context);

  void addFavorite(String productId) async {
    emit(FavoriteLoadingState(message: "loading...."));
    favorites = [];
    var response = await addDeleteFavoriteUseCase.addFavorite(productId);

    response.fold(
      (l) {
        emit(FavoriteErrorState(message: l.errorMessage));
      },
      (r) {
        emit(GetFavoriteSuccessState());
      },
    );
  }

  void removeFavorite(String productId) async {
    emit(FavoriteLoadingState(message: "loading...."));
    favorites = [];

    var response = await removeFavoriteUseCase.RemoveFavorite(productId);

    response.fold(
      (l) {
        emit(FavoriteErrorState(message: l.errorMessage));
      },
      (r) {
        emit(GetFavoriteSuccessState());
      },
    );
  }

  void getFavoriteProduct() async {
    emit(FavoriteLoadingState(message: "loading...."));
    var response = await getFavoriteProductsUseCase.getFavoriteProduct();

    response.fold(
      (l) {
        emit(FavoriteErrorState(message: l.errorMessage));
      },
      (r) {
        favorites = r.data ?? [];
        emit(GetFavoriteSuccessState());
      },
    );
  }
}
