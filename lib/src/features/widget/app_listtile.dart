import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/theme_export.dart';

class AppListtile extends StatelessWidget {
  final Widget leading;
  final Widget? trailing;
  final Widget subtitle;
  final String? title;
  final Color? bgColor;
  final Color? borderColor;
  final VoidCallback? ontap;
  final TextStyle? titleTextstyle;

  const AppListtile({
    super.key,
    required this.leading,
    this.trailing,
    required this.subtitle,
    this.title,
    this.bgColor,
    this.borderColor,
    this.ontap,
    this.titleTextstyle,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing12,
          vertical: AppSpacing.spacing8,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent),
          color: bgColor,
          borderRadius: AppBorders.borderRadiusSM,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Leading
            leading,
            AppSpacing.hGap8,

            //const SizedBox(width: 10),

            /// Title + Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: titleTextstyle ?? AppTextStyle.bodyMedium(),
                    ),
                  subtitle,
                ],
              ),
            ),
            AppSpacing.hGap8,
            //AppSpacing.horizontal8,
            // const SizedBox(width: 10),

            /// Trailing
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
