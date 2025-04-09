import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';

void interActiveToast(BuildContext context,
    {required Color bgColor, required String msg}) {
  InteractiveToast.slide(
    context,
    toastStyle: ToastStyle(
      backgroundColor: bgColor,
      expandedTitle: true,
    ),
    toastSetting: const SlidingToastSetting(
      showProgressBar: false,
      animationDuration: Duration(seconds: 1),
      displayDuration: Duration(seconds: 1),
      toastAlignment: Alignment.topCenter,
    ),
    title: Text(
      msg,
      textAlign: TextAlign.center,
      style: AppStyles.medium18White,
    ),
  );
}
