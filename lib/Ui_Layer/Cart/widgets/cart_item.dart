import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Domain_Layer/Entities/get_cart_response_entity.dart';
import '../Cubit/cart_items_screen_view_model.dart';

class CartItem extends StatelessWidget {
  final GetProductsEntity productEntity;

  const CartItem({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: MyColors.lightGreyColor, width: 1.w)),
        width: 398.w,
        height: 145.h,
        child: Row(
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                width: 130.w,
                height: 145.h,
                fit: BoxFit.fill,
                imageUrl: productEntity.product?.imageCover ?? "",
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: MyColors.yellowColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: MyColors.redColor,
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            productEntity.product?.title ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontSize: 16.sp,
                                    color: MyColors.primaryColor,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            //    todo delete item from cart
                            CartItemsScreenViewModel.getInstance(context)
                                .deleteCartItemResponse(
                                    productEntity.product?.id ?? "");
                          },
                          child: Icon(
                            Icons.delete_outline,
                            color: MyColors.primaryColor,
                            size: 35.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: Text("Count : ${productEntity.count}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: MyColors.primaryColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Egp : ${productEntity.price}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: 16.sp,
                                  color: MyColors.primaryColor,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: MyColors.primaryColor,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  //   todo decrease count by one
                                  int productCount =
                                      productEntity.count?.toInt() ?? 1;

                                  productCount--;

                                  productCount == 1
                                      ? CartItemsScreenViewModel.getInstance(
                                              context)
                                          .updateCartItemResponse(
                                              productEntity.product?.id ?? "",
                                              productCount)
                                      : CartItemsScreenViewModel.getInstance(
                                              context)
                                          .deleteCartItemResponse(
                                          productEntity.product?.id ?? "",
                                        );
                                },
                                icon: Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: MyColors.whiteColor,
                                  size: 28.sp,
                                )),
                            Text(
                              "${productEntity.count}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.whiteColor),
                            ),
                            IconButton(
                                onPressed: () {
                                  //   todo increase count by one
                                  int productCount =
                                      productEntity.count?.toInt() ?? 1;

                                  productCount++;

                                  CartItemsScreenViewModel.getInstance(context)
                                      .updateCartItemResponse(
                                          productEntity.product?.id ?? "",
                                          productCount);
                                },
                                icon: Icon(Icons.add_circle_outline_rounded,
                                    color: MyColors.whiteColor, size: 28.sp))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
