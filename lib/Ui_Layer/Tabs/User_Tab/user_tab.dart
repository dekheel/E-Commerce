import 'package:e_commerce/Domain_Layer/dependency_injection.dart';
import 'package:e_commerce/Ui_Layer/Auth/Login/login_screen.dart';
import 'package:e_commerce/Ui_Layer/Tabs/User_Tab/Cubits/user_states.dart';
import 'package:e_commerce/Ui_Layer/Tabs/User_Tab/Cubits/user_tab_viewModel.dart';
import 'package:e_commerce/Ui_Layer/Utils/custom_text_field.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:e_commerce/Ui_Layer/Utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/functions_utils.dart';
import '../../Utils/my_assets.dart';

class UserTab extends StatelessWidget {
  UserTabViewModel viewModel =
      UserTabViewModel(getUserUseCase: injectGetUserUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel..getUserData(),
      builder: (context, state) {
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
                  state is UserLoadingStates
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: MyColors.darkPrimaryColor,
                        ))
                      : state is UserErrorStates
                          ? Center(
                              child: Text(state.failures?.errorMessage ?? "",
                                  textWidthBasis: TextWidthBasis.longestLine,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontSize: 18.sp,
                                          color: MyColors.primaryColor,
                                          fontWeight: FontWeight.normal)),
                            )
                          : Expanded(
                              child: Column(
                              children: [
                                CustomTextField(
                                    fieldName: "Your Full Name",
                                    fieldNameStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 18.sp,
                                            color: MyColors.primaryColor),
                                    hintText: "",
                                    controller: TextEditingController(
                                        text: viewModel
                                                .userEntity?.users?[0].name ??
                                            "")),
                                CustomTextField(
                                    fieldName: "Your Email",
                                    fieldNameStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 18.sp,
                                            color: MyColors.primaryColor),
                                    hintText: "",
                                    controller: TextEditingController(
                                        text: viewModel
                                                .userEntity?.users?[0].email ??
                                            "")),
                                CustomTextField(
                                    fieldName: "Created At",
                                    fieldNameStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 18.sp,
                                            color: MyColors.primaryColor),
                                    hintText: "",
                                    controller: TextEditingController(
                                        text: FunctionsUtils.getInstance()
                                            .formatTextDate(viewModel.userEntity
                                                    ?.users?[0].createdAt ??
                                                "")
                                            .toString())),
                              ],
                            ))
                ]));
      },
    );
  }
}
