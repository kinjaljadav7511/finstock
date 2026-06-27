
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'theme_export.dart';


class AppTextStyle {
  AppTextStyle._();  
  static const String fontFamily = 'Inter';
  
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  
  
  
  static  double baseFontSize = 16.0.sp;
  //headings
  static  TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.0.sp,
    fontWeight: medium,
    height: 1.5.h,
    letterSpacing: -0.5.w,
    color: AppColors.textPrimary,
  );
  
    static  TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.0.sp,
    fontWeight: medium,
    height: 1.5.h,
    letterSpacing: -0.3.w,
    color: AppColors.textPrimary,
  );
  
   static  TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.0.sp,
    fontWeight: medium,
    height: 1.5.h,
    letterSpacing: -0.2.w,
    color: AppColors.textPrimary,
  );
  
  
  static  TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0.sp,
    fontWeight: medium,
    height: 1.5.h,
    color: AppColors.textPrimary,
  );
  
  static  TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0.sp,
    fontWeight: regular,
    height: 1.5.h,
    color: AppColors.textPrimary,
  );
  
  static  TextStyle bodyLargeMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0.sp,
    fontWeight: medium,
    height: 1.5.h,
    color: AppColors.textPrimary,
  );
  
  static  TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0.sp,
    fontWeight: regular,
    height: 1.5.h,
    color: AppColors.textPrimary,
  );
  
  static  TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0.sp,
    fontWeight: regular,
    height: 1.5.h,
    color: AppColors.textSecondary,
  );
  
  
  static  TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0.sp,
    fontWeight: medium,
    height: 1.5.h,
    color: AppColors.textPrimary,
  );
  
  static  TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0.sp,
    fontWeight: medium,
    height: 1.5.h,
    color: AppColors.textSecondary,
  );
  
    static  TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0.sp,
    fontWeight: medium,
    height: 1.5.h,
    color: AppColors.textSecondary,
  );
  
  static  TextStyle labelExtraSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10.0.sp,
    fontWeight: medium,
    height: 1.4.h,
    color: AppColors.textTertiary,
  );
  
   static  TextStyle buttonLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0.sp,
    fontWeight: medium,
    height: 1.5.h,
    letterSpacing: 0.1.w,
  );
  
    static  TextStyle buttonMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0.sp,
    fontWeight: medium,
    height: 1.5.h,
    letterSpacing: 0.1.w,
  );
  
    static  TextStyle buttonSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0.sp,
    fontWeight: medium,
    height: 1.5.h,
    letterSpacing: 0.1.w,
  );
  
static  TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0.sp,
    fontWeight: regular,
    height: 1.4.h,
    color: AppColors.textTertiary,
  );
  
    static  TextStyle overline = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10.0.sp,
    fontWeight: medium,
    height: 1.6.h,
    letterSpacing: 1.0.w,
    color: AppColors.textTertiary,
  );
  
    static  TextStyle price = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.0.sp,
    fontWeight: medium,
    height: 1.4.h,
    letterSpacing: -0.3.w,
    color: AppColors.textPrimary,
  );
  
    static  TextStyle priceLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.0.sp,
    fontWeight: semiBold,
    height: 1.3.h,
    letterSpacing: -0.5.w,
    color: AppColors.textPrimary,
  );
  
    static  TextStyle badge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10.0.sp,
    fontWeight: medium,
    height: 1.4.h,
    letterSpacing: 0.2.w,
  );
  
    static  TextStyle navLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0.sp,
    fontWeight: regular,
    height: 1.3.h,
  );
  
  static  TextStyle navLabelActive = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0.sp,
    fontWeight: medium,
    height: 1.3.h,
  );
  
  static  TextStyle input = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0.sp,
    fontWeight: regular,
    height: 1.5.h,
    color: AppColors.textPrimary,
  );
  
  static  TextStyle inputHint = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.0.sp,
    fontWeight: regular,
    height: 1.5.h,
    color: AppColors.textTertiary,
  );
  
    static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }
  
  
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }
  
  
  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }
}

TextTheme getAppTextTheme() {
  return  TextTheme(
    displayLarge: AppTextStyle.h1,
    displayMedium: AppTextStyle.h2,
    displaySmall: AppTextStyle.h3,
    headlineLarge: AppTextStyle.h1,
    headlineMedium: AppTextStyle.h2,
    headlineSmall: AppTextStyle.h3,
    titleLarge: AppTextStyle.h2,
    titleMedium: AppTextStyle.h3,
    titleSmall: AppTextStyle.h4,
    bodyLarge: AppTextStyle.bodyLarge,
    bodyMedium: AppTextStyle.bodyMedium,
    bodySmall: AppTextStyle.bodySmall,
    labelLarge: AppTextStyle.buttonLarge,
    labelMedium: AppTextStyle.labelMedium,
    labelSmall: AppTextStyle.labelSmall,
  );
}
