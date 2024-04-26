import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Domain_Layer/Entities/product_response_entity.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../Cubit/products_tab_view_model.dart';

class ProductItem extends StatelessWidget {
  ProductEntity product;
  bool isWishListed;

  ProductItem({required this.isWishListed, required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: MyColors.primaryColor, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  width: 191.w,
                  height: 128.h,
                  fit: BoxFit.cover,
                  imageUrl: product.imageCover!,
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
              Positioned(
                  top: 5.h,
                  right: 2.w,
                  child: CircleAvatar(
                    backgroundColor: MyColors.whiteColor,
                    radius: 15,
                    child: IconButton(
                        onPressed: null,
                        color: MyColors.primaryColor,
                        padding: EdgeInsets.zero,
                        icon: isWishListed
                            ? const Icon(
                                Icons.favorite_rounded,
                                color: MyColors.primaryColor,
                              )
                            : const Icon(
                                Icons.favorite_border_rounded,
                                color: MyColors.primaryColor,
                              )),
                  ))
            ],
          ),
          Gap(2.h),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? "",
                  textWidthBasis: TextWidthBasis.longestLine,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: MyColors.darkPrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp),
                ),
                Gap(2.h),
                Text(
                  product.description ?? "",
                  textWidthBasis: TextWidthBasis.longestLine,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: MyColors.darkPrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp),
                ),
                Gap(2.h),
                Row(
                  children: [
                    Text(
                      "EGP ${product.price}",
                      textWidthBasis: TextWidthBasis.longestLine,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: MyColors.darkPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    ),
                    Gap(10.w),
                  ],
                ),
                Gap(1.h),
                Row(
                  children: [
                    Text(
                      "Review (${product.ratingsAverage})   ",
                      textWidthBasis: TextWidthBasis.longestLine,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: MyColors.darkPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    ),
                    Gap(7.w),
                    const Icon(
                      Icons.star,
                      color: MyColors.yellowColor,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    InkWell(
                      onTap: () {
                        //   todo add to cart

                        ProductTabViewModel.get(context)
                            .addProductToCart(product.id ?? "");
                      },
                      splashColor: Colors.transparent,
                      child: Icon(
                        Icons.add_circle,
                        size: 32.sp,
                        color: MyColors.primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
