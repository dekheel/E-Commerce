import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowSectionBreak extends StatelessWidget {
  final String name;

  const RowSectionBreak({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: MyColors.darkPrimaryColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              "View All",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: MyColors.darkPrimaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            ))
      ],
    );
  }
}
