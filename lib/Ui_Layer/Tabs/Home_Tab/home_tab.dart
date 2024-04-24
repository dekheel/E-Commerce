import 'package:e_commerce/Domain_Layer/dependency_injection.dart';
import 'package:e_commerce/Ui_Layer/Tabs/Home_Tab/Cubit/home_tab_states.dart';
import 'package:e_commerce/Ui_Layer/Tabs/Home_Tab/Cubit/home_tab_view_model.dart';
import 'package:e_commerce/Ui_Layer/Tabs/Home_Tab/widgets/announcements.dart';
import 'package:e_commerce/Ui_Layer/Tabs/Home_Tab/widgets/categories_brands.dart';
import 'package:e_commerce/Ui_Layer/Tabs/Home_Tab/widgets/custom_search_shopping_cart.dart';
import 'package:e_commerce/Ui_Layer/Tabs/Home_Tab/widgets/row_section_widget.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_assets.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel viewModel = HomeTabViewModel(
      categoriesUseCase: injectGetAllCategoriesUseCase(),
      brandsUseCase: injectGetAllBrandsUseCase());

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel
        ..getAllCategories()
        ..getAllBrands(),
      builder: (context, state) {
        return SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Image.asset(
                  MyAssets.routeText,
                  height: 26.h,
                  width: 66.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 18.h,
                ),
                const CustomSearchWithShoppingCart(),
                SizedBox(
                  height: 16.h,
                ),
                Announcement(
                    context: context,
                    sliderImageStrings: viewModel.announcementList),
                SizedBox(
                  height: 16.h,
                ),
                const RowSectionBreak(name: "Categories"),
                SizedBox(
                  height: 24.h,
                ),

                SizedBox(
                    height: 225.h,
                    child: state is GetAllCategoriesLoadingStates
                        ? const Center(
                            child: CircularProgressIndicator(
                                color: MyColors.primaryColor),
                          )
                        : state is GetAllCategoriesErrorStates
                            ? Center(
                                child: Text(
                                    textWidthBasis: TextWidthBasis.longestLine,
                                    state.failures.errorMessage ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            fontSize: 18.sp,
                                            color: MyColors.primaryColor,
                                            fontWeight: FontWeight.normal)))
                            : CategoriesOrBrands(
                                list: viewModel.categoryResponseEntities)
                    // : const SizedBox.shrink()
                    ),
                SizedBox(
                  height: 24.h,
                ),
                const RowSectionBreak(name: "Brands"),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                    height: 150.h,
                    child: state is GetAllBrandsLoadingStates
                        ? const Center(
                            child: CircularProgressIndicator(
                                color: MyColors.primaryColor),
                          )
                        : state is GetAllBrandsErrorStates
                            ? Center(
                                child: Text(
                                    textWidthBasis: TextWidthBasis.longestLine,
                                    state.failures.errorMessage ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            fontSize: 18.sp,
                                            color: MyColors.primaryColor,
                                            fontWeight: FontWeight.normal)))
                            : CategoriesOrBrands(
                                list: viewModel.brandsResponseEntities)),
                // CategoriesOrBrands(categories: []),
              ],
            ),
          ),
        ));
      },
    );
  }
}
