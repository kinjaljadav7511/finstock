import 'package:flutter/material.dart';

import '../../theme/theme_export.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  final VoidCallback? onTap;

  const IconContainer({
    super.key,
    required this.icon,
    this.onTap,
    required this.backgroundColor,
    required this.iconColor,
    this.size = 56.0,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppBorders.radiusMD),
        ),
        child: Icon(icon, color: iconColor, size: iconSize),
      ),
    );
  }
}
