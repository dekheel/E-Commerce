import 'package:e_commerce/Ui_Layer/Home/home_states.dart';
import 'package:e_commerce/Ui_Layer/Tabs/Products_Tab/products_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Tabs/Home_Tab/home_tab.dart';
import '../../Tabs/favorite_tab.dart';
import '../../Tabs/user_tab.dart';

class HomeScreenViewModel extends Cubit<HomeStates> {
  HomeScreenViewModel() : super(HomeInitialState());

// todo: hold data
  int selectedIndex = 0;
  List<Widget> bodyList = [
    HomeTab(),
    ProductTab(),
    const FavoriteTab(),
    const UserTab()
  ];

  void bottomNavOnTap(int index) {
    emit(HomeBottomNavTapState());
    selectedIndex = index;
    emit(HomeInitialState());
  }
}
