import 'package:e_commerce/Ui_Layer/Tabs/Favorite_Tab/Cubit/favorite_states.dart';
import 'package:e_commerce/Ui_Layer/Tabs/Favorite_Tab/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../Domain_Layer/dependency_injection.dart';
import '../../Utils/my_assets.dart';
import '../../Utils/my_colors.dart';
import '../Home_Tab/widgets/custom_search_shopping_cart.dart';
import 'Cubit/favorite_tab_view_model.dart';

class FavoriteTab extends StatelessWidget {
  FavoriteTabViewModel viewModel = FavoriteTabViewModel(
      addDeleteFavoriteUseCase: injectAddRemoveFavoriteUseCase(),
      getFavoriteProductsUseCase: injectGetFavoriteUseCase(),
      removeFavoriteUseCase: injectRemoveFavoriteUseCase());

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteTabViewModel, FavoriteStates>(
        bloc: viewModel..getFavoriteProduct(),
        builder: (context, state) {
          return SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Image.asset(
                  MyAssets.routeText,
                  height: 26.h,
                  width: 66.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 18.h,
                ),
                CustomSearchWithShoppingCart(
                  cartItem: "",
                ),
                SizedBox(
                  height: 16.h,
                ),
                state is FavoriteLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: MyColors.primaryColor),
                      )
                    : state is FavoriteErrorState
                        ? Center(
                            child: Text(
                                textWidthBasis: TextWidthBasis.longestLine,
                                state.message ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontSize: 18.sp,
                                        color: MyColors.primaryColor,
                                        fontWeight: FontWeight.normal)))
                        : Expanded(
                            child: ListView.builder(
                            itemCount: viewModel.favorites?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 24.h),
                                child: Slidable(
                                  key: ValueKey<int>(index),
                                  startActionPane: ActionPane(
                                    extentRatio: 0.2.w,
                                    motion: const DrawerMotion(),
                                    children: [
                                      SlidableAction(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        autoClose: true,
                                        onPressed: (context) {
                                          viewModel.removeFavorite(
                                              viewModel.favorites?[index].id ??
                                                  "");
                                        },
                                        backgroundColor: MyColors.redColor,
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),
                                    ],
                                  ),
                                  child: FavoriteItem(
                                    product: viewModel.favorites![index],
                                  ),
                                ),
                              );
                            },
                          ))
              ],
            ),
          ));
        });
  }
}
