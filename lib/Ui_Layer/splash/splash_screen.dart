import 'dart:async';
import 'package:e_commerce/Ui_Layer/Auth/Login/login_screen.dart';
import 'package:e_commerce/Ui_Layer/Auth/Register/register_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // wait 3 seconds then navigate to home screen
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
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
