import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

/// Design System Borders extracted from Telecalling CRM
class AppBorders {
  AppBorders._();

  static  double get radiusSM => 8.0.r;
  static  double get radiusMD => 12.0.r;
  static  double get radiusLG => 16.0.r;
  static  double get radiusXL => 20.0.r;
  static  double get radiusXXL => 24.0.r;
  static  double get radiusFull => 999.0.r;
  static  double get radiusDefault => 10.0.r;

  static  BorderRadius borderRadiusSM = BorderRadius.all(
    Radius.circular(radiusSM),
  );
  static  BorderRadius borderRadiusMD = BorderRadius.all(
    Radius.circular(radiusMD),
  );
  static  BorderRadius borderRadiusLG = BorderRadius.all(
    Radius.circular(radiusLG),
  );
  static  BorderRadius borderRadiusXL = BorderRadius.all(
    Radius.circular(radiusXL),
  );
  static  BorderRadius borderRadiusXXL = BorderRadius.all(
    Radius.circular(radiusXXL),
  );
  static  BorderRadius borderRadiusFull = BorderRadius.all(
    Radius.circular(radiusFull),
  );
  static  BorderRadius borderRadiusDefault = BorderRadius.all(
    Radius.circular(radiusDefault),
  );
  static  BorderRadius bottomSheetRadius = BorderRadius.only(
    topLeft: Radius.circular(radiusXXL),
    topRight: Radius.circular(radiusXXL),
  );
}
