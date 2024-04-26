import 'package:e_commerce/Ui_Layer/Tabs/Home_Tab/widgets/search_text_field.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_assets.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchWithShoppingCart extends StatelessWidget {
  final String? cartItem;

  const CustomSearchWithShoppingCart({this.cartItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SearchTextField(
          onTap: null,
        )),
        SizedBox(width: 24.w),
        InkWell(
            onTap: () {},
            child: Badge(
              label: Text(cartItem ?? "0"),
              child: ImageIcon(
                const AssetImage(MyAssets.shoppingCart),
                size: 28.sp,
                color: MyColors.primaryColor,
              ),
            ))
      ],
    );
  }
}
