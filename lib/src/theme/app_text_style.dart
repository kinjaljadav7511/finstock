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

  static double baseFontSize = 16.sp;

  // Headings

  static TextStyle h1({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 24.sp,
        fontWeight: medium,
        height: 1.5,
        letterSpacing: -0.5.w,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle h2({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 20.sp,
        fontWeight: medium,
        height: 1.5,
        letterSpacing: -0.3.w,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle h3({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 18.sp,
        fontWeight: medium,
        height: 1.5,
        letterSpacing: -0.2.w,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle h4({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16.sp,
        fontWeight: medium,
        height: 1.5,
        color: color ?? AppColors.textPrimary,
      );

  // Body

  static TextStyle bodyLarge({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16.sp,
        fontWeight: regular,
        height: 1.5,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle bodyLargeMedium({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16.sp,
        fontWeight: medium,
        height: 1.5,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle bodyMedium({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 14.sp,
        fontWeight: regular,
        height: 1.5,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle bodySmall({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.sp,
        fontWeight: regular,
        height: 1.5,
        color: color ?? AppColors.textSecondary,
      );

  // Labels

  static TextStyle labelLarge({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16.sp,
        fontWeight: medium,
        height: 1.5,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle labelMedium({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 14.sp,
        fontWeight: medium,
        height: 1.5,
        color: color ?? AppColors.textSecondary,
      );

  static TextStyle labelSmall({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.sp,
        fontWeight: medium,
        height: 1.5,
        color: color ?? AppColors.textSecondary,
      );

  static TextStyle labelExtraSmall({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 10.sp,
        fontWeight: medium,
        height: 1.4,
        color: color ?? AppColors.textTertiary,
      );

  // Buttons

  static TextStyle buttonLarge({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16.sp,
        fontWeight: medium,
        height: 1.5,
        letterSpacing: 0.1.w,
        color: color,
      );

  static TextStyle buttonMedium({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 14.sp,
        fontWeight: medium,
        height: 1.5,
        letterSpacing: 0.1.w,
        color: color,
      );

  static TextStyle buttonSmall({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.sp,
        fontWeight: medium,
        height: 1.5,
        letterSpacing: 0.1.w,
        color: color,
      );

  // Caption

  static TextStyle caption({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.sp,
        fontWeight: regular,
        height: 1.4,
        color: color ?? AppColors.textTertiary,
      );

  static TextStyle overline({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 10.sp,
        fontWeight: medium,
        height: 1.6,
        letterSpacing: 1.w,
        color: color ?? AppColors.textTertiary,
      );

  // Price

  static TextStyle price({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 20.sp,
        fontWeight: medium,
        height: 1.4,
        letterSpacing: -0.3.w,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle priceLarge({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 24.sp,
        fontWeight: semiBold,
        height: 1.3,
        letterSpacing: -0.5.w,
        color: color ?? AppColors.textPrimary,
      );

  // Others

  static TextStyle badge({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 10.sp,
        fontWeight: medium,
        height: 1.4,
        letterSpacing: 0.2.w,
        color: color,
      );

  static TextStyle navLabel({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.sp,
        fontWeight: regular,
        height: 1.3,
        color: color,
      );

  static TextStyle navLabelActive({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.sp,
        fontWeight: medium,
        height: 1.3,
        color: color,
      );

  static TextStyle input({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16.sp,
        fontWeight: regular,
        height: 1.5,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle inputHint({Color? color}) => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16.sp,
        fontWeight: regular,
        height: 1.5,
        color: color ?? AppColors.textTertiary,
      );
}

TextTheme getAppTextTheme() {
  return TextTheme(
    displayLarge: AppTextStyle.h1(),
    displayMedium: AppTextStyle.h2(),
    displaySmall: AppTextStyle.h3(),
    headlineLarge: AppTextStyle.h1(),
    headlineMedium: AppTextStyle.h2(),
    headlineSmall: AppTextStyle.h3(),
    titleLarge: AppTextStyle.h2(),
    titleMedium: AppTextStyle.h3(),
    titleSmall: AppTextStyle.h4(),
    bodyLarge: AppTextStyle.bodyLarge(),
    bodyMedium: AppTextStyle.bodyMedium(),
    bodySmall: AppTextStyle.bodySmall(),
    labelLarge: AppTextStyle.buttonLarge(),
    labelMedium: AppTextStyle.labelMedium(),
    labelSmall: AppTextStyle.labelSmall(),
  );
}