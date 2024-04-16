import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Domain_Layer/Entities/category_brand_response_entity.dart';
import 'category_brand_item.dart';

class CategoriesOrBrands extends StatelessWidget {
  List<CategoryOrBrandEntity> list;

  CategoriesOrBrands({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 16.h, crossAxisSpacing: 16.w),
      itemCount: list.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      primary: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return CategoryOrBrandItem(category: list[index]);
      },
    );
  }
}
