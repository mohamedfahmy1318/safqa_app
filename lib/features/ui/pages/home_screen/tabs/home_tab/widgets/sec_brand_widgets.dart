import 'package:ecommerce_app/domain/entities/CategoryORBrandResponseEntity.dart';
import 'package:ecommerce_app/features/ui/widgets/category_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox buildCategoryBrandSec({required List<CategoryOrBrandEntity> list}) {
  return SizedBox(
    height: 250.h,
    width: double.infinity,
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemCount: list.length,
      scrollDirection: Axis.horizontal,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return CategoryBrandItem(
          item: list[index],
        );
      },
    ),
  );
}
