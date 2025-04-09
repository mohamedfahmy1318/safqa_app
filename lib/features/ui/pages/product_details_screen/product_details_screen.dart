import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int productCounter = 0;
  int selectedColor = -1;
  int selectedSize = -1;

  List<int> sizes = [35, 38, 39, 40];
  List<Color> color = [
    Colors.red,
    Colors.blueAccent,
    Colors.green,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ProductEntity;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: AppStyles.semi20Primary,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.primaryColor,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.primaryColor,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlideshow(
                  indicatorColor: AppColors.primaryColor,
                  children: args.images!.map((e) => Image.network(e)).toList()),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      args.title ?? '',
                      style: AppStyles.medium18Header,
                    ),
                  ),
                  Text(
                    "EGP ${args.price}",
                    style: AppStyles.medium18Header,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.primaryColor.withOpacity(.3),
                          width: 1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Text(
                      '${args.sold} Sold',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.medium14PrimaryDark,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Image.asset(
                    AppAssets.starIcon,
                    width: 20.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(
                    child: Text(
                      "4.8 (${args.ratingsAverage})",
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.regular14Text,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              productCounter--;
                              setState(() {});
                            },
                            child: Icon(
                              Icons.remove_circle_outline,
                              size: 20.w,
                              color: AppColors.whiteColor,
                            )),
                        SizedBox(
                          width: 18.w,
                        ),
                        AutoSizeText(
                          '$productCounter',
                          style: AppStyles.medium18White,
                        ),
                        SizedBox(
                          width: 18.w,
                        ),
                        InkWell(
                            onTap: () {
                              productCounter++;
                              setState(() {});
                            },
                            child: Icon(
                              Icons.add_circle_outline,
                              color: AppColors.whiteColor,
                              size: 20.w,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: AppStyles.semi20Primary.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  ReadMoreText(
                    args.description ?? '',
                    style: AppStyles.medium14LightPrimary,
                    trimExpandedText: ' Read Less',
                    trimCollapsedText: ' Read More',
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    colorClickableText: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total price',
                        style: AppStyles.medium18Header.copyWith(
                            color: AppColors.primaryColor.withOpacity(0.6)),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text('EGP 3,500', style: AppStyles.medium18Header)
                    ],
                  ),
                  SizedBox(
                    width: 33.w,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17.r)),
                          backgroundColor: AppColors.primaryColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 14.h),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_shopping_cart,
                              color: AppColors.whiteColor,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            AutoSizeText("Add To Cart",
                                style: AppStyles.medium20White),
                            SizedBox(
                              width: 27.w,
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
