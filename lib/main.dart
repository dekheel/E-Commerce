import 'package:e_commerce/Ui_Layer/Auth/Login/login_screen.dart';
import 'package:e_commerce/Ui_Layer/Home/home_screen.dart';
import 'package:e_commerce/Ui_Layer/Utils/app_theme.dart';
import 'package:e_commerce/Ui_Layer/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Ui_Layer/Auth/Register/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        restorationScopeId: "Test",
        // <-- Add this line for windows apps
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen()
        },
        theme: AppTheme.mainTheme,
      ),
    );
  }
}
