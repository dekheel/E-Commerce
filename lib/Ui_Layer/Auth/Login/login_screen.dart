import 'package:e_commerce/Ui_Layer/Auth/Login/Cubit/login_screen_view_model.dart';
import 'package:e_commerce/Ui_Layer/Auth/Register/register_screen.dart';
import 'package:e_commerce/Ui_Layer/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Domain_Layer/dependency_injection.dart';
import '../../Utils/custom_text_field.dart';
import '../../Utils/dialog_utils.dart';
import '../../Utils/my_assets.dart';
import '../../Utils/my_colors.dart';
import '../auth_states.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel viewModel =
      LoginScreenViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(
              context: context, loadingMessage: "loading.....");
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context, content: state.errorMessage!);
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context);

          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          // Fluttertoast.showToast(
          //     msg: state.authResultEntity!.userEntity!.name!,
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.red,
          //     textColor: Colors.white,
          //     fontSize: 16.sp);
        }
      },
      child: Scaffold(
        body: Container(
          color: MyColors.primaryColor,
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
                      Text(
                        "Welcome back to route",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 24.sp),
                      ),
                      Text(
                        "Please sign in with your email",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 16.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
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
                              TextButton(
                                  onPressed: () {
                                    //   todo: reset password
                                  },
                                  child: Text(
                                    "Forgot password",
                                    textAlign: TextAlign.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 18.sp),
                                  )),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 35.h, bottom: 32.h),
                                child: ElevatedButton(
                                  onPressed: () {
                                    //   todo: login
                                    viewModel.login();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: MyColors.whiteColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.r))),
                                  ),
                                  child: SizedBox(
                                    height: 64.h,
                                    width: 398.w,
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                            color: MyColors.primaryColor,
                                                fontSize: 20.sp),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: TextButton(
                                    onPressed: () {
                                      //   todo: navigate to register screen
                                      Navigator.pushNamed(
                                          context, RegisterScreen.routeName);
                                    },
                                    child: Text(
                                      "Don’t have an account? Create Account",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w400),
                                    )),
                              ),
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
