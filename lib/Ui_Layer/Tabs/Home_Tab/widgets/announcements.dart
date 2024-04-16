import 'package:e_commerce/Ui_Layer/Utils/my_assets.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Announcement extends StatelessWidget {
  List<String> sliderImageStrings = [
    MyAssets.announcementImage1,
    MyAssets.announcementImage2,
    MyAssets.announcementImage3,
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
        indicatorColor: MyColors.primaryColor,
        initialPage: 0,
        indicatorBottomPadding: 20.h,
        indicatorBackgroundColor: MyColors.whiteColor,
        isLoop: true,
        autoPlayInterval: 3000,
        children: sliderImageStrings.map((url) {
          return Image.asset(url);
        }).toList());
  }
}
