import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

Widget lineBreak({required String name}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(name,
          style:
              AppStyles.medium18Header.copyWith(color: AppColors.primaryColor)),
      TextButton(
        onPressed: () {
          //todo: navigate to all
        },
        child: Text("View All", style: AppStyles.regular12Text),
      )
    ],
  );
}
