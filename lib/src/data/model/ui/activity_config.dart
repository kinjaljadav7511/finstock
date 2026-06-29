 import 'package:flutter/material.dart';

import '../../../core/enum/enum.dart';
import '../../../theme/theme_export.dart';

Map<String, dynamic> activityConfig(ActivityType type) {
    switch (type) {
      case ActivityType.order:
        return {
          'icon': Icons.shopping_bag_outlined,
          'color': AppColors.primary,
          'bg': AppColors.indigoIconBg,
        };
      case ActivityType.payment:
        return {
          'icon': Icons.attach_money,
          'color': AppColors.success,
          'bg': AppColors.greenIconBg,
        };
      case ActivityType.completed:
        return {
          'icon': Icons.check_circle_outline,
          'color': AppColors.info,
          'bg': AppColors.blueIconBg,
        };
      case ActivityType.stockAlert:
        return {
          'icon': Icons.warning_amber_outlined,
          'color': AppColors.warning,
          'bg': AppColors.amberIconBg,
        };
    }
  }
