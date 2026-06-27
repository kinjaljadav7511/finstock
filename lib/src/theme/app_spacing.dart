import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  AppSpacing._();

  
  // Space
  static double get xs => 4.w;
  static double get sm => 8.w;
  static double get md => 12.w;
  static double get lg => 16.w;
  static double get xl => 20.w;
  static double get xxl => 24.w;
  static double get xxxl => 32.w;
  static double get xxxxl => 40.w;
  static double get xxxxxl => 48.w;


  static  double get screenPadding => 16.0.w;
  static  double get cardPadding => 16.0.w;
  static  double get sectionSpacing => 24.0.w;
  static  double get bottomNavHeight => 64.0.h;
  static  double get appBarHeight => 56.0.h;
  static  double get fabSize => 56.0.sp;
  
  static  double get iconSizeSmall => 16.0.sp;
  static  double get iconSizeMedium => 20.0.sp;
  static  double get iconSizeLarge => 24.0.sp;
  static  double get iconSizeExtraLarge => 32.0.sp;

  static  double get iconContainerSize => 40.0.h;
  static  double get iconContainerLarge => 56.0.h;

  static  double get listItemHeight => 72.0.h;
  static  double get inputHeight => 48.0.h;
  static  double get buttonHeight => 48.0.h;
  static  double get chipHeight => 32.0.h;
  static  double get maxContentWidth => 480.0.w;


  static  EdgeInsets paddingXS = EdgeInsets.all(xs);
  static  EdgeInsets paddingSM = EdgeInsets.all(sm);
  static  EdgeInsets paddingMD = EdgeInsets.all(md);
  static  EdgeInsets paddingLG = EdgeInsets.all(lg);
  static  EdgeInsets paddingXL = EdgeInsets.all(xl);
  static  EdgeInsets paddingXXL = EdgeInsets.all(xxl);
  static  EdgeInsets paddingXXXL = EdgeInsets.all(xxxl);

  static  EdgeInsets horizontalXS = EdgeInsets.symmetric(horizontal: xs);
  static  EdgeInsets horizontalSM = EdgeInsets.symmetric(horizontal: sm);
  static  EdgeInsets horizontalMD = EdgeInsets.symmetric(horizontal: md);
  static  EdgeInsets horizontalLG = EdgeInsets.symmetric(horizontal: lg);
  static  EdgeInsets horizontalXL = EdgeInsets.symmetric(horizontal: xl);
  static  EdgeInsets horizontalXXL = EdgeInsets.symmetric(horizontal: xxl);

  static  EdgeInsets verticalXS = EdgeInsets.symmetric(vertical: xs);
  static  EdgeInsets verticalSM = EdgeInsets.symmetric(vertical: sm);
  static  EdgeInsets verticalMD = EdgeInsets.symmetric(vertical: md);
  static  EdgeInsets verticalLG = EdgeInsets.symmetric(vertical: lg);
  static  EdgeInsets verticalXL = EdgeInsets.symmetric(vertical: xl);
  static  EdgeInsets verticalXXL = EdgeInsets.symmetric(vertical: xxl);

  static  EdgeInsets screenEdgePadding = EdgeInsets.symmetric(
    horizontal: screenPadding,
    vertical: lg,
  );
  static  EdgeInsets screenEdgePaddingH = EdgeInsets.symmetric(
    horizontal: screenPadding,
  );
  static  EdgeInsets cardContentPadding = EdgeInsets.all(cardPadding);
  static  EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );
  static  EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );
  static  EdgeInsets chipPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: 6.0,
  );
  static  EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  static  EdgeInsets dialogPadding = EdgeInsets.all(xxl);
  static  EdgeInsets appBarPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: lg,
  );

  static  double get gapXS => xs;
  static  double get gapSM => sm;
  static  double get gapMD => md;
  static  double get gapLG => lg;
  static  double get gapXL => xl;
  static  double get gapXXL => xxl;
  static  double get gapXXXL => xxxl;

  static  SizedBox  vGapXS = SizedBox(height: xs);
  static  SizedBox  vGapSM = SizedBox(height: sm);
  static  SizedBox  vGapMD = SizedBox(height: md);
  static  SizedBox  vGapLG = SizedBox(height: lg);
  static  SizedBox  vGapXL = SizedBox(height: xl);
  static  SizedBox  vGapXXL = SizedBox(height: xxl);
  static  SizedBox  vGapXXXL = SizedBox(height: xxxl);
  static  SizedBox  hGapXS = SizedBox(width: xs);
  static  SizedBox  hGapSM = SizedBox(width: sm);
  static  SizedBox  hGapMD = SizedBox(width: md);
  static  SizedBox  hGapLG = SizedBox(width: lg);
  static  SizedBox  hGapXL = SizedBox(width: xl);
  static  SizedBox  hGapXXL = SizedBox(width: xxl);
}
