import 'package:finstock/src/theme/app_spacing.dart';
import 'package:finstock/src/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget  {
  final String title;
  const BaseAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppTextStyle.buttonLarge),
      toolbarHeight: AppSpacing.appBarHeight,
    );
  }
  
  @override
  
  Size get preferredSize => Size.fromHeight(AppSpacing.appBarHeight);
}
