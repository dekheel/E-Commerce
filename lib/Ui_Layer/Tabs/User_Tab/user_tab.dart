import 'package:e_commerce/Ui_Layer/Auth/Login/login_screen.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:e_commerce/Ui_Layer/Utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/my_assets.dart';

class UserTab extends StatelessWidget {
  const UserTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    MyAssets.routeText,
                    height: 26.h,
                    width: 66.w,
                    fit: BoxFit.fill,
                  ),
                  IconButton(
                      onPressed: () {
                        SharedPreference.removeUserToken();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginScreen.routeName,
                          (route) {
                            return false;
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.logout_outlined,
                        color: MyColors.primaryColor,
                      ))
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
            ]));
  }
}
