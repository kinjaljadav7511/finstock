import 'package:flutter/material.dart';

import '../../theme/theme_export.dart';

class AppDivider extends StatelessWidget {
  final double? height;
  final Color? color;

  const AppDivider({super.key, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 1,
      thickness: 1,
      color: color ?? AppColors.divider,
    );
  }
}
