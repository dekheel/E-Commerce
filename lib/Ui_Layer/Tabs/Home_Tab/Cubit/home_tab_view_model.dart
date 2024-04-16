import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Domain_Layer/Entities/category_brand_response_entity.dart';
import '../../../../Domain_Layer/Use_Cases/get_all_brands_use_case.dart';
import '../../../../Domain_Layer/Use_Cases/get_all_categories_use_case.dart';
import 'home_tab_states.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase categoriesUseCase;

  GetAllBrandsUseCase brandsUseCase;

  HomeTabViewModel(
      {required this.categoriesUseCase, required this.brandsUseCase})
      : super(HomeTabInitialStates());
  List<CategoryOrBrandEntity> categoryResponseEntities = [];
  List<CategoryOrBrandEntity> brandsResponseEntities = [];

  void getAllCategories() async {
    emit(GetAllCategoriesLoadingStates(loading: "loading...."));
    var categoriesEither = await categoriesUseCase.getAllCategoriesInvoke();

    categoriesEither
        .fold((failure) => emit(GetAllCategoriesErrorStates(failures: failure)),
            (response) {
      categoryResponseEntities = response.data ?? [];
      emit(GetAllCategoriesSuccessStates());
    });
  }

  void getAllBrands() async {
    emit(GetAllBrandsLoadingStates(loading: "loading...."));
    var brandsEither = await brandsUseCase.getAllBrandsInvoke();

    brandsEither.fold(
        (failure) => emit(GetAllBrandsErrorStates(failures: failure)), (r) {
      brandsResponseEntities = r.data ?? [];
      emit(GetAllBrandsSuccessStates());
    });
  }
}
