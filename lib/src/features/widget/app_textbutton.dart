import 'package:finstock/src/theme/app_colors.dart';
import 'package:finstock/src/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  const AppTextButton({
    super.key,
    required this.title,
    required this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // behavior: HitTestBehavior.opaque,
      child: Text(
        title,
        style: AppTextStyle.labelMedium(color: textColor ?? AppColors.primary),
      ),
    );
  }
}
