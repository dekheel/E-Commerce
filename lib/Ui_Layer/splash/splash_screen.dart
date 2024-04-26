import 'dart:async';

import 'package:e_commerce/Ui_Layer/Auth/Login/login_screen.dart';
import 'package:e_commerce/Ui_Layer/Home/home_screen.dart';
import 'package:e_commerce/Ui_Layer/Utils/shared_preferences.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // wait 3 seconds then navigate to home screen
    Timer(const Duration(seconds: 3), () async {
      var user = SharedPreference.readData(key: SharedPreference.userTokenKey);

      if (user == null) {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      }
    });
    return Scaffold(
      body: Image.asset(
        "assets/images/Splash Screen.png",
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
