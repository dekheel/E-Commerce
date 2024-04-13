import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  String fieldName;
  String hintText;
  Widget? suffixIcon;
  bool isObscure;
  TextInputType keyBoardType;
  void Function()? suffixIconFunction;
  String? Function(String?)? validator;
  TextEditingController controller;

  CustomTextField(
      {required this.fieldName,
      required this.hintText,
      this.suffixIcon,
      this.isObscure = false,
      this.validator,
      required this.controller,
      this.suffixIconFunction,
      this.keyBoardType = TextInputType.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          fieldName,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 18.sp, color: AppColors.whiteColor),
          textAlign: TextAlign.start,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: AppColors.whiteColor,
                filled: true,
                suffixIcon: InkWell(
                    onTap: suffixIconFunction,
                    child: suffixIcon ?? const SizedBox.shrink()),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.blueGreyColor),
                    borderRadius: BorderRadius.circular(15.r)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.blueGreyColor),
                    borderRadius: BorderRadius.circular(15.r)),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.blueGreyColor),
                    borderRadius: BorderRadius.circular(15.r)),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.greyColor)),
            style: const TextStyle(color: AppColors.blackColor),
            validator: validator,
            controller: controller,
            obscureText: isObscure,
            keyboardType: keyBoardType,
          ),
        )
      ],
    );
  }
}
