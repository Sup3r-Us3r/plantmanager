import 'package:flutter/material.dart';
import 'package:plantmanager/core/app_colors.dart';

class AppTextStyles {
  static final TextStyle heading = TextStyle(
    color: AppColors.heading,
    fontFamily: 'Jost-SemiBold',
    fontWeight: FontWeight.w600,
    fontSize: 13.0,
  );

  static final TextStyle headingDanger = TextStyle(
    color: AppColors.red,
    fontFamily: 'Jost-SemiBold',
    fontWeight: FontWeight.w600,
    fontSize: 13.0,
  );

  static final TextStyle heading15 = TextStyle(
    color: AppColors.blue,
    fontFamily: 'Jost-Regular',
    fontWeight: FontWeight.w400,
    fontSize: 15.0,
  );

  static final TextStyle heading24 = TextStyle(
    color: AppColors.heading,
    fontFamily: 'Jost-SemiBold',
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
  );

  static final TextStyle heading32 = TextStyle(
    color: AppColors.heading,
    fontFamily: 'Jost-SemiBold',
    fontWeight: FontWeight.w600,
    fontSize: 32.0,
  );

  static final TextStyle bodyDark = TextStyle(
    color: AppColors.bodyDark,
    fontFamily: 'Jost-Regular',
    fontWeight: FontWeight.w400,
    fontSize: 17.0,
  );

  static final TextStyle bodyLight = TextStyle(
    color: AppColors.bodyLight,
    fontFamily: 'Jost-Regular',
    fontWeight: FontWeight.w400,
    fontSize: 17.0,
  );

  static final TextStyle textButton = TextStyle(
    color: AppColors.white,
    fontFamily: 'Jost-Medium',
    fontWeight: FontWeight.w500,
    fontSize: 17.0,
  );

  static final TextStyle bottomNavigatorTextActive = TextStyle(
    color: AppColors.green,
    fontFamily: 'Jost-Regular',
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
  );

  static final TextStyle bottomNavigatorTextDisable = TextStyle(
    color: AppColors.gray,
    fontFamily: 'Jost-Regular',
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
  );
}
