import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/domain/entities/CategoryORBrandResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class CategoryBrandItem extends StatelessWidget {
  CategoryBrandItem({super.key, required this.item});
  CategoryOrBrandEntity item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 10,
            child: CachedNetworkImage(
              width: 80.w,
              height: 50.h,
              fit: BoxFit.cover,
              imageUrl: item.image ?? "",
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 10.r,
                );
              },
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: AppColors.primaryColor,
              ),
            )),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 4,
            child: Text(
              item.name ?? "",
              textWidthBasis: TextWidthBasis.longestLine,
              softWrap: true,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
            ))
      ],
    );
  }
}
