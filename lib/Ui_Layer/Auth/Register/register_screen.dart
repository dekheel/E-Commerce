import 'package:e_commerce/Domain_Layer/dependency_injection.dart';
import 'package:e_commerce/Ui_Layer/Auth/Register/Cubit/register_screen_view_model.dart';
import 'package:e_commerce/Ui_Layer/Auth/Register/Cubit/register_states.dart';
import 'package:e_commerce/Ui_Layer/Utils/custom_text_field.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/dialog_utils.dart';
import '../../Utils/my_colors.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(
              context: context, loadingMessage: "loading.....");
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context, content: state.errorMessage!);
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              content: state.authResultEntity?.userEntity?.name ?? "");
        }
      },
      child: Scaffold(
        body: Container(
          color: AppColors.primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 46.h, right: 97.w, left: 97.w),
                  child: Image.asset(MyAssets.routeImage),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                fieldName: "Full Name",
                                hintText: "enter your name",
                                controller: viewModel.nameController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "please enter your name";
                                  }
                                  return null;
                                },
                              ),
                              CustomTextField(
                                fieldName: "E-mail address",
                                hintText: "enter your email address",
                                controller: viewModel.emailController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "please enter your email address";
                                  }
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);

                                  if (!emailValid) {
                                    return "invalid email";
                                  }
                                  return null;
                                },
                              ),
                              CustomTextField(
                                fieldName: "Password",
                                hintText: "enter your password",
                                controller: viewModel.passwordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "please enter password";
                                  }

                                  if (value.trim().length < 6 ||
                                      value.trim().length > 30) {
                                    return "password should be > 6 & < 30";
                                  }

                                  return null;
                                },
                                keyBoardType: TextInputType.visiblePassword,
                                isObscure: viewModel.isObscure,
                                suffixIcon: InkWell(
                                  child: viewModel.isObscure
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModel.isObscure) {
                                      viewModel.isObscure = false;
                                    } else {
                                      viewModel.isObscure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              CustomTextField(
                                fieldName: "Confirmation Password",
                                hintText: "enter your confirmation password",
                                controller:
                                    viewModel.confirmationPasswordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "please enter password";
                                  }

                                  if (value !=
                                      viewModel.passwordController.text) {
                                    return "passwords dosen't match";
                                  }

                                  return null;
                                },
                                keyBoardType: TextInputType.visiblePassword,
                                isObscure: viewModel.isObscure,
                                suffixIcon: InkWell(
                                  child: viewModel.isObscure
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModel.isObscure) {
                                      viewModel.isObscure = false;
                                    } else {
                                      viewModel.isObscure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              CustomTextField(
                                fieldName: "Mobile Number",
                                hintText: "enter your mobile no",
                                controller: viewModel.phoneController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "please enter your mobile no";
                                  }

                                  return null;
                                },
                                keyBoardType: TextInputType.phone,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 35.h, bottom: 89.h),
                                child: ElevatedButton(
                                  onPressed: () {
                                    //   todo: register
                                    viewModel.register();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.whiteColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.r))),
                                  ),
                                  child: SizedBox(
                                    height: 64.h,
                                    width: 398.w,
                                    child: Center(
                                      child: Text(
                                        "SignUp",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                color: AppColors.primaryColor,
                                                fontSize: 20.sp),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
