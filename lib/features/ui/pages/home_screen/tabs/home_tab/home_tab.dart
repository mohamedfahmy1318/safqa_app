import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_cubit.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/home_tab/widgets/image_slide_show.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/home_tab/widgets/line_break_Widget.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/home_tab/widgets/sec_brand_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_assets.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          buildAnnouncement(
            images: [
              AppAssets.announcement1,
              AppAssets.announcement2,
              AppAssets.announcement3,
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          lineBreak(name: "Categories"),
          BlocBuilder<HomeTabViewModel, HomeTabStates>(
            bloc: viewModel..getAllCategories(),
            builder: (context, state) {
              return viewModel.categoriesList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : buildCategoryBrandSec(list: viewModel.categoriesList);
            },
          ),
          lineBreak(name: "Brands"),
          BlocBuilder<HomeTabViewModel, HomeTabStates>(
            bloc: viewModel..getAllBrands(),
            builder: (context, state) {
              return viewModel.brandList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : buildCategoryBrandSec(list: viewModel.brandList);
            },
          ),
        ],
      ),
    );
  }
}
