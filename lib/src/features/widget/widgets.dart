// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../theme/theme_export.dart';

// // ==================== STATUS BADGE ====================

// /// Status badge widget with predefined colors
// class StatusBadge extends StatelessWidget {
//   final String status;
//   final String? label;

//   const StatusBadge({super.key, required this.status, this.label});

//   @override
//   Widget build(BuildContext context) {
//     final colors =
//         AppColors.statusColors[status.toLowerCase()] ??
//         AppColors.statusColors['pending']!;

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//         color: colors['background'],
//         borderRadius: BorderRadius.circular(AppBorders.radiusFull),
//         border: Border.all(color: colors['border']!),
//       ),
//       child: Text(
//         label ?? _capitalize(status),
//         style: AppTextStyle.badge(color: colors['text']),
//       ),
//     );
//   }

//   String _capitalize(String text) {
//     if (text.isEmpty) return text;
//     return text[0].toUpperCase() + text.substring(1);
//   }
// }

// // ==================== APP CARD ====================

// /// Card widget with design system styling
// class AppCard extends StatelessWidget {
//   final Widget child;
//   final EdgeInsetsGeometry? padding;
//   final VoidCallback? onTap;
//   final bool elevated;

//   const AppCard({
//     super.key,
//     required this.child,
//     this.padding,
//     this.onTap,
//     this.elevated = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final content = Container(
//       padding: padding ?? AppSpacing.cardContentPadding,
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         borderRadius: AppBorders.borderRadiusLG,
//         boxShadow: elevated ? AppShadows.md : AppShadows.sm,
//       ),
//       child: child,
//     );

//     if (onTap != null) {
//       return Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: onTap,
//           borderRadius: AppBorders.borderRadiusLG,
//           child: content,
//         ),
//       );
//     }

//     return content;
//   }
// }

// // ==================== ICON CONTAINER ====================

// /// Colored icon container for dashboard/quick actions
// class IconContainer extends StatelessWidget {
//   final IconData icon;
//   final Color backgroundColor;
//   final Color iconColor;
//   final double size;
//   final double iconSize;

//   const IconContainer({
//     super.key,
//     required this.icon,
//     required this.backgroundColor,
//     required this.iconColor,
//     this.size = 40.0,
//     this.iconSize = 20.0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(AppBorders.radiusMD),
//       ),
//       child: Icon(icon, color: iconColor, size: iconSize),
//     );
//   }
// }

// // ==================== PRIMARY BUTTON ====================

// /// Primary action button
// class PrimaryButton extends StatelessWidget {
//   final String label;
//   final VoidCallback? onPressed;
//   final bool isLoading;
//   final IconData? icon;

//   const PrimaryButton({
//     super.key,
//     required this.label,
//     this.onPressed,
//     this.isLoading = false,
//     this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: isLoading ? null : onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.primary,
//         foregroundColor: AppColors.onPrimary,
//         disabledBackgroundColor: AppColors.gray300,
//       ),
//       child: isLoading
//           ? const SizedBox(
//               width: 20,
//               height: 20,
//               child: CircularProgressIndicator(
//                 strokeWidth: 2,
//                 valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
//               ),
//             )
//           : icon != null
//           ? Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(icon, size: AppSpacing.iconSizeMedium),
//                 AppSpacing.hGapSM,
//                 Text(label),
//               ],
//             )
//           : Text(label),
//     );
//   }
// }

// // ==================== SEARCH BAR ====================

// /// Search input field
// class SearchBar extends StatelessWidget {
//   final String? placeholder;
//   final ValueChanged<String>? onChanged;
//   final TextEditingController? controller;

//   const SearchBar({
//     super.key,
//     this.placeholder,
//     this.onChanged,
//     this.controller,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       onChanged: onChanged,
//       style: AppTextStyle.input(),
//       decoration: InputDecoration(
//         hintText: placeholder ?? 'Search...',
//         hintStyle: AppTextStyle.inputHint(),
//         prefixIcon: Icon(
//           Icons.search,
//           color: AppColors.textDisabled,
//           size: AppSpacing.iconSizeMedium,
//         ),
//         filled: true,
//         fillColor: AppColors.gray50,
//         border: OutlineInputBorder(
//           borderRadius: AppBorders.borderRadiusMD,
//           borderSide: const BorderSide(color: AppColors.inputBorder),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: AppBorders.borderRadiusMD,
//           borderSide: const BorderSide(color: AppColors.inputBorder),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: AppBorders.borderRadiusMD,
//           borderSide: const BorderSide(color: AppColors.focusRing, width: 2),
//         ),
//         contentPadding: EdgeInsets.symmetric(
//           horizontal: AppSpacing.spacing16,
//           vertical: AppSpacing.spacing12,
//         ),
//       ),
//     );
//   }
// }

// // ==================== FILTER CHIP ====================

// /// Filter chip for category/status filtering
// class FilterChip extends StatelessWidget {
//   final String label;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const FilterChip({
//     super.key,
//     required this.label,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//         decoration: BoxDecoration(
//           color: isSelected ? AppColors.primary : AppColors.gray100,
//           borderRadius: BorderRadius.circular(AppBorders.radiusFull),
//         ),
//         child: Text(
//           label,
//           style: AppTextStyle.buttonSmall(
//             color: isSelected ? AppColors.white : AppColors.textPrimary,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ==================== BOTTOM SHEET HEADER ====================

// /// Bottom sheet header with title
// class BottomSheetHeader extends StatelessWidget {
//   final String title;
//   final VoidCallback? onClose;

//   const BottomSheetHeader({super.key, required this.title, this.onClose});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: AppSpacing.padding16,
//       decoration: const BoxDecoration(
//         border: Border(bottom: BorderSide(color: AppColors.borderStrong)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           if (onClose != null) const SizedBox(width: 40),
//           Expanded(
//             child: Text(
//               title,
//               style: AppTextStyle.h3(),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           if (onClose != null)
//             IconButton(
//               icon: const Icon(Icons.close),
//               onPressed: onClose,
//               iconSize: AppSpacing.iconSizeLarge,
//             )
//           else
//             const SizedBox(width: 40),
//         ],
//       ),
//     );
//   }
// }

// // ==================== EMPTY STATE ====================

// /// Empty state widget
// class EmptyState extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String? subtitle;
//   final String? actionLabel;
//   final VoidCallback? onAction;

//   const EmptyState({
//     super.key,
//     required this.icon,
//     required this.title,
//     this.subtitle,
//     this.actionLabel,
//     this.onAction,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: AppSpacing.padding24,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 64, color: AppColors.textDisabled),
//             AppSpacing.vGapLG,
//             Text(
//               title,
//               style: AppTextStyle.h3(color: AppColors.textSecondary),
//               textAlign: TextAlign.center,
//             ),
//             if (subtitle != null) ...[
//               AppSpacing.vGapSM,
//               Text(
//                 subtitle!,
//                 style: AppTextStyle.bodySmall(),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//             if (actionLabel != null && onAction != null) ...[
//               AppSpacing.vGapXL,
//               TextButton(onPressed: onAction, child: Text(actionLabel!)),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ==================== DIVIDER ====================

// /// Custom divider with design system styling
// class AppDivider extends StatelessWidget {
//   final double? height;
//   final Color? color;

//   const AppDivider({super.key, this.height, this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Divider(
//       height: height ?? 1.h,
//       thickness: 1,
//       color: color ?? AppColors.divider,
//     );
//   }
// }

// // ==================== METRIC CARD ====================

// /// Dashboard metric card
// class MetricCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final IconData icon;
//   final Color iconBackgroundColor;
//   final Color iconColor;
//   final String? subtitle;
//   final String? change;
//   final bool? isPositive;

//   const MetricCard({
//     super.key,
//     required this.title,
//     required this.value,
//     required this.icon,
//     required this.iconBackgroundColor,
//     required this.iconColor,
//     this.subtitle,
//     this.change,
//     this.isPositive,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppCard(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           IconContainer(
//             icon: icon,
//             backgroundColor: iconBackgroundColor,
//             iconColor: iconColor,
//           ),
//           AppSpacing.vGapMD,
//           Text(title, style: AppTextStyle.bodySmall()),
//           AppSpacing.vGapXS,
//           Row(
//             children: [
//               Text(value, style: AppTextStyle.h2()),
//               if (change != null) ...[
//                 AppSpacing.hGapSM,
//                 Text(
//                   change!,
//                   style: AppTextStyle.labelSmall(
//                     color: isPositive == true
//                         ? AppColors.success
//                         : AppColors.error,
//                   ),
//                 ),
//               ],
//             ],
//           ),
//           if (subtitle != null) ...[
//             AppSpacing.vGapXS,
//             Text(subtitle!, style: AppTextStyle.labelExtraSmall()),
//           ],
//         ],
//       ),
//     );
//   }
// }
