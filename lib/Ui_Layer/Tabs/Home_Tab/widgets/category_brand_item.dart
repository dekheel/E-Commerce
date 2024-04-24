import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Domain_Layer/Entities/category_brand_response_entity.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryOrBrandItem extends StatelessWidget {
  CategoryOrBrandEntity category;

  CategoryOrBrandItem({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: CachedNetworkImage(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .25,
              fit: BoxFit.fill,
              imageUrl: category.image!,
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 50.r,
                );
              },
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: MyColors.yellowColor,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: MyColors.redColor,
              ),
            )),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 4,
            child: Text(
              category.name ?? "",
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: MyColors.darkPrimaryColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
            ))
      ],
    );
  }
}
