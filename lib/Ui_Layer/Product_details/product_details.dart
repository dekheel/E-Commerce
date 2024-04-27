import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

import '../../Domain_Layer/Entities/product_response_entity.dart';
import '../Tabs/Home_Tab/widgets/announcements.dart';
import '../Utils/my_assets.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = "ProductDetails";

  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var productEntity =
        ModalRoute.of(context)!.settings.arguments as ProductEntity?;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(productEntity?.title ?? ""),
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
              icon: const ImageIcon(
                AssetImage(MyAssets.shoppingCart),
                color: MyColors.primaryColor,
              )),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
                color: MyColors.primaryColor,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: MyColors.greyColor, width: 2)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Announcement(
                          context: context,
                          imagesHeight: 300.h,
                          sliderImageStrings: productEntity?.images ?? [],
                          loadFromAsset: false))),
              Gap(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    productEntity?.title ?? "",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.primaryColor),
                  )),
                  Text(
                    "EGP ${productEntity?.price ?? ""} ",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.primaryColor),
                  ),
                ],
              ),
              Gap(16.h),
              Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(
                                color: MyColors.primaryColor, width: .75)),
                        child: Text(
                          "Sold : ${productEntity?.sold}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.primaryColor),
                        ),
                      ),
                      Gap(16.w),
                      const Icon(
                        Icons.star,
                        color: MyColors.yellowColor,
                      ),
                      Gap(4.w),
                      Text(
                        "${productEntity?.ratingsAverage!} ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.primaryColor),
                      )
                    ],
                  )),
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
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: MyColors.whiteColor,
                              size: 28.sp,
                            )),
                        Text(
                          "1",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.whiteColor),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_circle_outline_rounded,
                                color: MyColors.whiteColor, size: 28.sp))
                      ],
                    ),
                  )
                ],
              ),
              Gap(10.h),
              Text(
                "Description",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: MyColors.primaryColor),
              ),
              Gap(10.h),
              ReadMoreText(
                productEntity?.description ?? "",
                trimLines: 3,
                trimMode: TrimMode.Line,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: MyColors.primaryColor),
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: MyColors.primaryColor),
                lessStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: MyColors.primaryColor),
              ),
              Gap(120.h),
              Row(
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
                        "EGP ${productEntity?.price ?? ""} ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: MyColors.whiteColor,
                                  size: 28.sp,
                                ),
                                Text(
                                  "Add To Cart",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: MyColors.whiteColor),
                                ),
                              ],
                            ),
                          )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
