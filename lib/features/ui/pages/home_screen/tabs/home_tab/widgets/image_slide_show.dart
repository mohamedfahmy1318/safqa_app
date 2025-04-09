import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ImageSlideshow buildAnnouncement({
  required List<String> images,
}) {
  return ImageSlideshow(
      indicatorColor: AppColors.primaryColor,
      initialPage: 0,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorRadius: 5,
      indicatorBackgroundColor: AppColors.whiteColor,
      isLoop: true,
      autoPlayInterval: 3000,
      height: 190.h,
      children: images.map((url) {
        return Image.asset(
          url,
          fit: BoxFit.fill,
        );
      }).toList());
}
