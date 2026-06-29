import 'package:finstock/src/features/widget/app_card.dart';
import 'package:finstock/src/features/widget/icon_container.dart';
import 'package:flutter/material.dart';

import '../../theme/theme_export.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;
  final String? subtitle;
  final String? change;
  final bool? isPositive;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
    this.subtitle,
    this.change,
    this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconContainer(
            icon: icon,
            backgroundColor: iconBackgroundColor,
            iconColor: iconColor,
          ),
          //AppSpacing.vGapMD,
          Text(title, style: AppTextStyle.bodySmall()),
          //AppSpacing.vGapXS,
          Row(
            children: [
              Text(value, style: AppTextStyle.labelMedium()),
              if (change != null) ...[
                AppSpacing.hGap8,
                Text(
                  change!,
                  style: AppTextStyle.labelSmall(
                    color: isPositive == true
                        ? AppColors.success
                        : AppColors.error,
                  ),
                ),
              ],
            ],
          ),
          if (subtitle != null) ...[
            //AppSpacing.vGapXS,
            Text(subtitle!, style: AppTextStyle.labelExtraSmall()),
          ],
        ],
      ),
    );
  }
}
