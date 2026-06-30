import 'package:flutter/material.dart';

import '../../theme/theme_export.dart';

class BottomSheetHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onClose;

  const BottomSheetHeader({super.key, required this.title, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.padding16,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.borderStrong)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (onClose != null) const SizedBox(width: 40),
          Expanded(
            child: Text(
              title,
              style: AppTextStyle.h3(),
              textAlign: TextAlign.center,
            ),
          ),
          if (onClose != null)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: onClose,
              iconSize: AppSpacing.iconSize24,
            )
          else
            const SizedBox(width: 40),
        ],
      ),
    );
  }
}
