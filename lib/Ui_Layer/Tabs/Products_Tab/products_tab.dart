import 'package:e_commerce/Domain_Layer/dependency_injection.dart';
import 'package:e_commerce/Ui_Layer/Product_details/product_details.dart';
import 'package:e_commerce/Ui_Layer/Tabs/Products_Tab/widgets/product_item.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/my_assets.dart';
import '../Home_Tab/widgets/custom_search_shopping_cart.dart';
import 'Cubit/products_tab_states.dart';
import 'Cubit/products_tab_view_model.dart';

class ProductTab extends StatelessWidget {
  ProductTabViewModel viewModel = ProductTabViewModel(
      productsUseCase: injectGetAllProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase());

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductTabViewModel>(
      create: (context) => viewModel..getAllProducts(),
      child: BlocBuilder<ProductTabViewModel, ProductTabStates>(
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
                  cartItem: viewModel.numOfCartItem.toString(),
                ),
                SizedBox(
                  height: 16.h,
                ),
                state is ProductLoadingStates
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: MyColors.darkPrimaryColor,
                        ),
                      )
                    : state is ProductErrorStates
                        ? Center(
                            child: Text(state.failures.errorMessage ?? "",
                                textWidthBasis: TextWidthBasis.longestLine,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontSize: 18.sp,
                                        color: MyColors.primaryColor,
                                        fontWeight: FontWeight.normal)),
                          )
                        : Expanded(
                            child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2 / 2.4,
                                    crossAxisSpacing: 16.w,
                                    mainAxisSpacing: 16.h),
                            itemCount: viewModel.productResponseEntities.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ProductDetails.routeName,
                                      arguments: viewModel
                                          .productResponseEntities[index]);
                                },
                                child: ProductItem(
                                    product: viewModel
                                        .productResponseEntities[index],
                                    isWishListed: false),
                              );
                            },
                          ))
              ],
            ),
          ));
        },
      ),
    );
  }
}
