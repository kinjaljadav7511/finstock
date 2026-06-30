import 'package:flutter/material.dart';

import '../../theme/theme_export.dart';

class SearchBar extends StatelessWidget {
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const SearchBar({
    super.key,
    this.placeholder,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: AppTextStyle.input(),
      decoration: InputDecoration(
        hintText: placeholder ?? 'Search...',
        hintStyle: AppTextStyle.inputHint(),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.textDisabled,
          size: AppSpacing.iconSize20,
        ),
        filled: true,
        fillColor: AppColors.gray50,
        border: OutlineInputBorder(
          borderRadius: AppBorders.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppBorders.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorders.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.focusRing, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing16,
          vertical: AppSpacing.spacing12,
        ),
      ),
    );
  }
}
