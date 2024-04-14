import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'my_assets.dart';
import 'my_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  BuildContext context;
  int selectedIndex;
  void Function(int)? onTap;

  CustomBottomNavBar(
      {required this.context,
      required this.selectedIndex,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: MyColors.primaryColor),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          iconSize: 10.spMin,
          currentIndex: selectedIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  foregroundColor: selectedIndex == 0
                      ? MyColors.primaryColor
                      : MyColors.whiteColor,
                  backgroundColor: selectedIndex == 0
                      ? MyColors.whiteColor
                      : Colors.transparent,
                  radius: 20.r,
                  child: ImageIcon(
                    AssetImage(
                      selectedIndex == 0
                          ? MyAssets.selectedHomeIcon
                          : MyAssets.unSelectedHomeIcon,
                    ),
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  foregroundColor: selectedIndex == 1
                      ? MyColors.primaryColor
                      : MyColors.whiteColor,
                  backgroundColor: selectedIndex == 1
                      ? MyColors.whiteColor
                      : Colors.transparent,
                  radius: 20.r,
                  child: ImageIcon(
                    AssetImage(
                      selectedIndex == 1
                          ? MyAssets.selectedCategoryIcon
                          : MyAssets.unSelectedCategoryIcon,
                    ),
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  foregroundColor: selectedIndex == 2
                      ? MyColors.primaryColor
                      : MyColors.whiteColor,
                  backgroundColor: selectedIndex == 2
                      ? MyColors.whiteColor
                      : Colors.transparent,
                  radius: 20.r,
                  child: ImageIcon(
                    AssetImage(
                      selectedIndex == 2
                          ? MyAssets.selectedFavoriteIcon
                          : MyAssets.unSelectedFavoriteIcon,
                    ),
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  foregroundColor: selectedIndex == 3
                      ? MyColors.primaryColor
                      : MyColors.whiteColor,
                  backgroundColor: selectedIndex == 3
                      ? MyColors.whiteColor
                      : Colors.transparent,
                  radius: 20.r,
                  child: ImageIcon(
                    AssetImage(
                      selectedIndex == 3
                          ? MyAssets.selectedUserIcon
                          : MyAssets.unSelectedUserIcon,
                    ),
                  ),
                ),
                label: ""),
          ],
        ),
      ),
    );
  }
}
