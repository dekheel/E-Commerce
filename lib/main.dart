import 'package:e_commerce/Ui_Layer/Auth/Login/login_screen.dart';
import 'package:e_commerce/Ui_Layer/Cart/cart_items_screen.dart';
import 'package:e_commerce/Ui_Layer/Home/home_screen.dart';
import 'package:e_commerce/Ui_Layer/Product_details/product_details.dart';
import 'package:e_commerce/Ui_Layer/Utils/app_theme.dart';
import 'package:e_commerce/Ui_Layer/Utils/shared_preferences.dart';
import 'package:e_commerce/Ui_Layer/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Ui_Layer/Auth/Register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await SharedPreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          ProductDetails.routeName: (context) => ProductDetails(),
          CartItemsScreen.routeName: (context) => CartItemsScreen()
        },
        theme: AppTheme.mainTheme,
      ),
    );
  }
}
