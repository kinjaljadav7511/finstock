import 'package:flutter/material.dart';

import '../../theme/theme_export.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final bool elevated;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.elevated = false,
  });

  @override
  Widget build(BuildContext context) {
    final content = Container(
      margin: EdgeInsets.zero,
      padding: padding ?? AppSpacing.padding12,
      //AppSpacing.cardContentPadding,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppBorders.borderRadiusLG,
        boxShadow: elevated ? AppShadows.md : AppShadows.sm,
      ),
      child: child,
    );

    // if (onTap != null) {
    //   return Material(
    //     color: Colors.transparent,
    //     child: InkWell(
    //       onTap: onTap,
    //       borderRadius: AppBorders.borderRadiusLG,
    //       child: content,
    //     ),
    //   );
    // }

    return content;
  }
}
