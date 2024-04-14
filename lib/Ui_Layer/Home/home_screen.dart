import 'package:e_commerce/Ui_Layer/Home/Cubit/home_view_model.dart';
import 'package:e_commerce/Ui_Layer/Home/home_states.dart';
import 'package:e_commerce/Ui_Layer/Utils/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewMoodel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeStates>(
      bloc: viewMoodel,
      builder: (context, state) {
        return Scaffold(
          body: viewMoodel.bodyList[viewMoodel.selectedIndex],
          bottomNavigationBar: CustomBottomNavBar(
              context: context,
              selectedIndex: viewMoodel.selectedIndex,
              onTap: viewMoodel.bottomNavOnTap),
        );
      },
    );
  }
}
