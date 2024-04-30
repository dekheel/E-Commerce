import 'package:e_commerce/Domain_Layer/dependency_injection.dart';
import 'package:e_commerce/Ui_Layer/Cart/Cubit/cart_item_states.dart';
import 'package:e_commerce/Ui_Layer/Cart/Cubit/cart_items_screen_view_model.dart';
import 'package:e_commerce/Ui_Layer/Cart/widgets/cart_item.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../Utils/dialog_utils.dart';

class CartItemsScreen extends StatelessWidget {
  static const String routeName = "CartItems";

  CartItemsScreen({super.key});

  final CartItemsScreenViewModel viewModel = CartItemsScreenViewModel(
      getCartUseCase: injectGetCartUseCase(),
      deleteCartItemUseCase: injectDeleteCartItemUseCase(),
      updateCartItemUseCase: injectUpdateCartItemUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartItemsScreenViewModel>(
      create: (context) => viewModel..getCartResponse(),
      child: BlocConsumer<CartItemsScreenViewModel, CartStates>(
        listener: (context, state) {
          if (state is UpdateCartItemLoadingState) {
            DialogUtils.showLoading(
                context: context, loadingMessage: "loading.....");
          } else if (state is UpdateCartItemErrorState) {
            DialogUtils.hideLoading(context);

            DialogUtils.showMessage(context: context, content: state.message!);
          } else if (state is UpdateCartItemSuccessState) {
            DialogUtils.hideLoading(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
              resizeToAvoidBottomInset: true,
              extendBody: false,
              appBar: AppBar(
                surfaceTintColor: Colors.transparent,
                centerTitle: true,
                elevation: 0,
                title: const Text("Cart"),
                backgroundColor: Colors.transparent,
                foregroundColor: MyColors.primaryColor,
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.primaryColor),
                actions: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search_outlined,
                        color: MyColors.primaryColor,
                      )),
                ],
              ),
              body: state is CartLoadingState ||
                      state is DeleteCartItemLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: MyColors.darkPrimaryColor,
                      ),
                    )
                  : state is CartErrorState
                      ? Center(
                          child: Text(state.message ?? "",
                              textWidthBasis: TextWidthBasis.longestLine,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontSize: 18.sp,
                                      color: MyColors.primaryColor,
                                      fontWeight: FontWeight.normal)),
                        )
                      : state is DeleteCartItemErrorState
                          ? Center(
                              child: Text(state.message ?? "",
                                  textWidthBasis: TextWidthBasis.longestLine,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontSize: 18.sp,
                                          color: MyColors.primaryColor,
                                          fontWeight: FontWeight.normal)),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: ListView.builder(
                                  itemCount: viewModel
                                      .cartProducts.data?.products?.length,
                                  itemBuilder: (context, index) {
                                    return CartItem(
                                      productEntity: viewModel
                                          .cartProducts.data!.products![index],
                                    );
                                  },
                                )),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 96.h, left: 16.w, right: 16.w),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Total Price",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        MyColors.primaryColor),
                                          ),
                                          Gap(5.h),
                                          Text(
                                            "EGP ${viewModel.cartProducts.data?.totalCartPrice} ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        MyColors.primaryColor),
                                          )
                                        ],
                                      ),
                                      Gap(32.w),
                                      Expanded(
                                          child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                height: 50.h,
                                                decoration: BoxDecoration(
                                                  color: MyColors.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.r),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      "Check Out",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium
                                                          ?.copyWith(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: MyColors
                                                                  .whiteColor),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward,
                                                      color:
                                                          MyColors.whiteColor,
                                                      size: 28.sp,
                                                    ),
                                                  ],
                                                ),
                                              )))
                                    ],
                                  ),
                                ),
                              ],
                            ));
        },
      ),
    );
  }
}
