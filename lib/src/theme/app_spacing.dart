import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  AppSpacing._();

  // Space
  static double get spacing4 => 4.w; //xs
  static double get spacing8 => 8.w; //sm
  static double get spacing12 => 12.w; //md
  static double get spacing16 => 16.w; //lg
  static double get spacing20 => 20.w; //xl
  static double get spacing24 => 24.w; //xxl
  static double get spacing32 => 32.w; //xxxl
  static double get spacing40 => 40.w; //xxxxl
  static double get spacing48 => 48.w; //xxxxxl

  static double get screenPadding => 16.0.w;
  static double get cardPadding => 16.0.w;
  static double get sectionSpacing => 24.0.w;
  static double get bottomNavHeight => 64.0.h;
  static double get appBarHeight => 56.0.h;
  static double get fabSize => 56.0.sp;

  static double get iconSizeSmall => 16.0.sp;
  static double get iconSizeMedium => 20.0.sp;
  static double get iconSizeLarge => 24.0.sp;
  static double get iconSizeExtraLarge => 32.0.sp;

  static double get iconContainerSize => 40.0.h;
  static double get iconContainerLarge => 56.0.h;

  static double get listItemHeight => 72.0.h;
  static double get inputHeight => 48.0.h;
  static double get buttonHeight => 48.0.h;
  static double get chipHeight => 32.0.h;
  static double get maxContentWidth => 480.0.w;

  static EdgeInsets padding4 = EdgeInsets.all(spacing4);
  static EdgeInsets padding8 = EdgeInsets.all(spacing8);
  static EdgeInsets padding12 = EdgeInsets.all(spacing12);
  static EdgeInsets padding16 = EdgeInsets.all(spacing16);
  static EdgeInsets padding20 = EdgeInsets.all(spacing20);
  static EdgeInsets padding24 = EdgeInsets.all(spacing24);
  static EdgeInsets padding32 = EdgeInsets.all(spacing32);

  static EdgeInsets horizontal4 = EdgeInsets.symmetric(horizontal: spacing4);
  static EdgeInsets horizontal8 = EdgeInsets.symmetric(horizontal: spacing8);
  static EdgeInsets horizontal12 = EdgeInsets.symmetric(horizontal: spacing12);
  static EdgeInsets horizontal16 = EdgeInsets.symmetric(horizontal: spacing16);
  static EdgeInsets horizontal20 = EdgeInsets.symmetric(horizontal: spacing20);
  static EdgeInsets horizontal24 = EdgeInsets.symmetric(horizontal: spacing24);

  static EdgeInsets vertical4 = EdgeInsets.symmetric(vertical: spacing4);
  static EdgeInsets vertical8 = EdgeInsets.symmetric(vertical: spacing8);
  static EdgeInsets vertical12 = EdgeInsets.symmetric(vertical: spacing12);
  static EdgeInsets vertical16 = EdgeInsets.symmetric(vertical: spacing16);
  static EdgeInsets vertical20 = EdgeInsets.symmetric(vertical: spacing20);
  static EdgeInsets vertical24 = EdgeInsets.symmetric(vertical: spacing24);

  static EdgeInsets screenEdgePadding = EdgeInsets.symmetric(
    horizontal: screenPadding,
    vertical: spacing16,
  );
  static EdgeInsets screenEdgePaddingH = EdgeInsets.symmetric(
    horizontal: screenPadding,
  );
  static EdgeInsets cardContentPadding = EdgeInsets.all(cardPadding);
  static EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: spacing16,
    vertical: spacing12,
  );
  static EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: spacing16,
    vertical: spacing12,
  );
  static EdgeInsets chipPadding = EdgeInsets.symmetric(
    horizontal: spacing12,
    vertical: 6.0,
  );
  static EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: spacing16,
    vertical: spacing12,
  );

  static EdgeInsets dialogPadding = EdgeInsets.all(spacing24);
  static EdgeInsets appBarPadding = EdgeInsets.symmetric(
    horizontal: spacing16,
    vertical: spacing16,
  );

  static double get gapXS => spacing4;
  static double get gapSM => spacing8;
  static double get gapMD => spacing12;
  static double get gapLG => spacing16;
  static double get gapXL => spacing20;
  static double get gapXXL => spacing24;
  static double get gapXXXL => spacing32;

  static SizedBox vGap4 = SizedBox(height: spacing4);
  static SizedBox vGap8 = SizedBox(height: spacing8);
  static SizedBox vGap12 = SizedBox(height: spacing12);
  static SizedBox vGap16 = SizedBox(height: spacing16);
  static SizedBox vGap20 = SizedBox(height: spacing20);
  static SizedBox vGap24 = SizedBox(height: spacing24);
  static SizedBox vGap32 = SizedBox(height: spacing32);
  static SizedBox hGap4 = SizedBox(width: spacing4);
  static SizedBox hGap8 = SizedBox(width: spacing8);
  static SizedBox hGap12 = SizedBox(width: spacing12);
  static SizedBox hGap16 = SizedBox(width: spacing16);
  static SizedBox hGap20 = SizedBox(width: spacing20);
  static SizedBox hGap24 = SizedBox(width: spacing24);
}
