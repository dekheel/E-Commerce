import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Announcement extends StatelessWidget {
  final List<String> sliderImageStrings;
  final bool loadFromAsset;

  final BuildContext context;

  final double? imagesHeight;

  const Announcement(
      {required this.context,
      required this.sliderImageStrings,
      this.loadFromAsset = true,
      this.imagesHeight,
      super.key});

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
          return loadFromAsset
              ? Image.asset(
                  url,
                  fit: BoxFit.fill,
                )
              : CachedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.fill,
                  height: imagesHeight,
                  width: double.infinity,
                  placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: MyColors.primaryColor,
                        ),
                      ),
                  errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: MyColors.redColor,
                      ));
        }).toList());
  }
}
