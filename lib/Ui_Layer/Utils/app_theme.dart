import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
      primaryColor: MyColors.primaryColor,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: MyColors.whiteColor),
        titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: MyColors.whiteColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: MyColors.primaryColor,
          elevation: 0,
          selectedIconTheme: IconThemeData(size: 10)));
}
