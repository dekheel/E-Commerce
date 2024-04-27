import 'package:e_commerce/Domain_Layer/dependency_injection.dart';
import 'package:e_commerce/Ui_Layer/Cart/Cubit/cart_item_states.dart';
import 'package:e_commerce/Ui_Layer/Cart/Cubit/cart_items_screen_view_model.dart';
import 'package:e_commerce/Ui_Layer/Cart/widgets/cart_item.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartItemsScreen extends StatelessWidget {
  static const String routeName = "CartItems";

  CartItemsScreen({super.key});

  CartItemsScreenViewModel viewModel =
      CartItemsScreenViewModel(getCartUseCase: injectGetCartUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemsScreenViewModel, CartStates>(
      bloc: viewModel..getCartResponse(),
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
              titleTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: MyColors.primaryColor,
                    )),
              ],
            ),
            body: state is CartLoadingState
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
                    : state is CartSuccessState
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: ListView.builder(
                                itemCount: viewModel.cartProducts.length,
                                itemBuilder: (context, index) {
                                  return CartItem(
                                    productEntity:
                                        viewModel.cartProducts[index],
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
                                                  color: MyColors.primaryColor),
                                        ),
                                        Gap(5.h),
                                        Text(
                                          "EGP ${state.cartResponse?.data?.totalCartPrice!} ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: MyColors.primaryColor),
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
                                                                FontWeight.w500,
                                                            color: MyColors
                                                                .whiteColor),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    color: MyColors.whiteColor,
                                                    size: 28.sp,
                                                  ),
                                                ],
                                              ),
                                            )))
                                  ],
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink());
      },
    );
  }
}
