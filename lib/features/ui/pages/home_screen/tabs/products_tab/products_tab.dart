import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/products_tab/cubit/product_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_routes.dart';
import '../../../../widgets/product_tab_item.dart';

class ProductsTab extends StatelessWidget {
  ProductsTab({super.key});

  ProductViewModel viewModel = getIt<ProductViewModel>();

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductViewModel, ProductStates>(
      bloc: viewModel..getAllProducts(),
      listener: (context, state) {
        // if (state is AddCartSuccessState) {
        //   Fluttertoast.showToast(
        //     msg: 'Added Successfully',
        //     backgroundColor: AppColors.greenColor,
        //   );
        // }
        // else if (state is AddCartErrorState) {
        //   Fluttertoast.showToast(
        //     msg: state.message.message,
        //     backgroundColor: AppColors.redColor,
        //   );
        // }
      },
      builder: (context, state) {
        return viewModel.productsList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
            : SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3.1.h,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h),
                      itemCount: viewModel.productsList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.productRoute,
                              arguments: viewModel.productsList[index],
                            );
                          },
                          child: ProductTabItem(
                            product: viewModel.productsList[index],
                          ),
                        );
                      },
                    ))
                  ],
                ),
              );
      },
    );
  }
}
