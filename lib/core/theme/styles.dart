import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfection_webapp/core/theme/app_colors.dart';
import 'package:perfection_webapp/core/theme/font_weight_helper.dart';

class Styles {
  static TextStyle font32SemiBold =
      TextStyle(fontSize: 32.sp, fontWeight: FontWeightHelper.semiBold);
  static TextStyle font18Regular =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeightHelper.regular);
  static TextStyle font16RegularLightGrey = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeightHelper.regular,
      color: AppColors.lightGrey);
}
