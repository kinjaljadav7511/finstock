import 'package:finstock/src/features/widget/widgets.dart';
import 'package:finstock/src/theme/theme_export.dart';
import 'package:flutter/material.dart';

import '../../widget/icon_container.dart';

class ActionCard extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  final VoidCallback onTap;
  final String title;

  const ActionCard({
    super.key,
    required this.icon,
    required this.onTap,
    this.backgroundColor,
    required this.iconColor,
    this.size = 56.0,
    this.iconSize = 24.0,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconContainer(
          onTap: onTap,
          icon: icon,
          backgroundColor: iconColor.withValues(alpha: 0.1),
          iconColor: iconColor,
        ),
        Text(title, style: AppTextStyle.bodySmall()),
      ],
    );
  }
}
