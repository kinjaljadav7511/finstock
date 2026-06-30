import 'package:flutter/material.dart';

import '../../../core/enum/enum.dart';
import '../../../theme/theme_export.dart';

class ActivityStatusUI {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;

  const ActivityStatusUI({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
  });
}

ActivityStatusUI activityStatus(ActivityType type) {
  switch (type) {
    case ActivityType.order:
      return const ActivityStatusUI(
        icon: Icons.shopping_bag_outlined,
        iconColor: AppColors.primary,
        bgColor: AppColors.indigoIconBg,
      );

    case ActivityType.payment:
      return const ActivityStatusUI(
        icon: Icons.attach_money,
        iconColor: AppColors.success,
        bgColor: AppColors.greenIconBg,
      );

    case ActivityType.completed:
      return const ActivityStatusUI(
        icon: Icons.check_circle_outline,
        iconColor: AppColors.info,
        bgColor: AppColors.blueIconBg,
      );

    case ActivityType.stockAlert:
      return const ActivityStatusUI(
        icon: Icons.warning_amber_outlined,
        iconColor: AppColors.warning,
        bgColor: AppColors.amberIconBg,
      );
  }
}