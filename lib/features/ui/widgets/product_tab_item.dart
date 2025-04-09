import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utils/inter_active_toast.dart';
import 'package:ecommerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/products_tab/cubit/product_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import 'custom_txt.dart';

class ProductTabItem extends StatelessWidget {
  const ProductTabItem({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductViewModel, ProductStates>(
      listener: (context, state) {
        if (state is AddCartSuccessState) {
          interActiveToast(
            context,
            bgColor: AppColors.greenColor,
            msg: 'Added Successfully',
          );
        } else if (state is AddCartErrorState) {
          Fluttertoast.showToast(
            msg: state.message.message,
            backgroundColor: AppColors.redColor,
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.primary30Opacity,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CachedNetworkImage(
                    width: 191.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                    imageUrl: product.imageCover ?? "",
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryDark,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: AppColors.redColor,
                    ),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    radius: 20.r,
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          // todo add to favorite
                        },
                        color: AppColors.primaryColor,
                        padding: EdgeInsets.zero,
                        iconSize: 30.r,
                        // Adjust icon size as needed
                        icon: const Icon(
                          Icons.favorite_border_rounded,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTxt(
                    text: product.description ?? "",
                    fontSize: 12.sp,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTxt(
                    text: product.title ?? "",
                    fontSize: 12.sp,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(children: [
                    CustomTxt(
                      text: "EGP ${product.price}",
                      fontSize: 14.sp,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    CustomTxt(
                      text: "EGP  ${product.price! * .25}",
                      textStyle: AppStyles.regular11SalePrice.copyWith(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 10.sp),
                    ),
                  ]),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      CustomTxt(
                        text: "Review (${product.ratingsAverage})",
                        fontSize: 12.sp,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.yellowColor,
                        size: 25.sp,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      InkWell(
                        onTap: () {
                          ProductViewModel.get(context)
                              .addToCart(product.id ?? "");
                        },
                        splashColor: Colors.transparent,
                        child: Icon(
                          Icons.add_circle,
                          size: 32.sp,
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
