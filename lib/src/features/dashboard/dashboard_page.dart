import 'package:finstock/src/core/constant/app_strings.dart';
import 'package:finstock/src/features/dashboard/dashboard_controller.dart';
import 'package:finstock/src/features/dashboard/widget/action_card.dart';
import 'package:finstock/src/features/widget/app_card.dart';
import 'package:finstock/src/features/widget/metric_card.dart';
import 'package:finstock/src/theme/theme_export.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../widget/app_textbutton.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Container(
          color: AppColors.surface,
          //    padding: AppSpacing.appBarPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.myBusiness, style: AppTextStyle.h2()),
                  // AppSpacing.vGapXS,
                  Text(
                    AppStrings.welcomeMessage,
                    style: AppTextStyle.bodySmall(),
                  ),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  borderRadius: BorderRadius.circular(AppBorders.radiusFull),
                ),
                child: Icon(
                  Icons.person,
                  color: AppColors.primary,
                  size: AppSpacing.iconSizeMedium,
                ),
              ),
            ],
          ),
        ),
        //content
        Expanded(
          child: ListView(
            children: [
              GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: AppSpacing.spacing12,
                crossAxisSpacing: AppSpacing.spacing12,
                childAspectRatio: 1.1,
                children: [
                  MetricCard(
                    title: AppStrings.todaySales,
                    value: '₹45,320',
                    icon: Icons.attach_money,
                    iconBackgroundColor: AppColors.indigoIconBg,
                    iconColor: AppColors.primary,
                    change: '+12.5%',
                    isPositive: true,
                  ),
                  MetricCard(
                    title: AppStrings.pendingPayments,
                    value: '₹18,500',
                    icon: Icons.access_time,
                    iconBackgroundColor: AppColors.amberIconBg,
                    iconColor: AppColors.warning,
                    subtitle: '12 invoices',
                  ),
                  MetricCard(
                    title: AppStrings.lowStockItems,
                    value: '8',
                    icon: Icons.warning,
                    iconBackgroundColor: AppColors.redIconBg,
                    iconColor: AppColors.error,
                    subtitle: AppStrings.needRestock,
                  ),
                  MetricCard(
                    title: AppStrings.totalOrders,
                    value: '24',
                    icon: Icons.shopping_bag,
                    iconBackgroundColor: AppColors.greenIconBg,
                    iconColor: AppColors.success,
                    subtitle: 'Today',
                  ),
                ],
              ),
              AppSpacing.vGap12,
              //Quick Actions
              Column(
                mainAxisAlignment: .start,
                crossAxisAlignment: .start,
                spacing: 5,
                children: [
                  Text(AppStrings.quickActions),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      ActionCard(
                        icon: Icons.add,
                        onTap: () {},

                        iconColor: AppColors.primary,
                        title: AppStrings.newOrder,
                      ),
                      ActionCard(
                        icon: Icons.receipt,
                        onTap: () {},
                        iconColor: AppColors.info,
                        title: AppStrings.newInvoice,
                      ),
                      ActionCard(
                        icon: Icons.inventory_2,
                        onTap: () {},
                        iconColor: AppColors.accent,
                        title: AppStrings.addProduct,
                      ),
                      ActionCard(
                        icon: Icons.person_add,
                        onTap: () {},
                        iconColor: AppColors.success,
                        title: AppStrings.addAccount,
                      ),
                    ],
                  ),
                ],
              ),
              AppSpacing.hGap12,
              Column(
                children: [
                  Row(
                    children: [
                      Text(AppStrings.recentActivities),
                      Spacer(),
                      AppTextButton(onTap: () {}, title: AppStrings.viewAll),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../data/model/data/dashboard_model.dart';
// import '../../data/model/ui/activity_config.dart';
// import 'dashboard_controller.dart';


// // Adjust import path to your project
// import 'package:finstock/src/theme/theme_export.dart';

// class DashboardPage extends GetView<DashboardController> {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//    // final controller = Get.find<DashboardController>();

//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: RefreshIndicator(
//           color: AppColors.primary,
//           onRefresh: () async => controller.refresh(),
//           child: SingleChildScrollView(
//             physics: const AlwaysScrollableScrollPhysics(),
//             padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 100.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _DashboardHeader(),
//                 SizedBox(height: 20.h),
//                 _StatsRow(ctrl: controller),
//                 SizedBox(height: 24.h),
//                 _QuickActions(),
//                 SizedBox(height: 24.h),
//                 _RecentActivities(ctrl: controller),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ── Header ───────────────────────────────────────────────────────────────────
// class _DashboardHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('My Business', style: AppTextStyle.h2()),
//               SizedBox(height: 2.h),
//               Text('Welcome back Arjun',
//                   style: AppTextStyle.bodySmall(color: AppColors.textSecondary)),
//             ],
//           ),
//         ),
//         Container(
//           width: 40.w,
//           height: 40.h,
//           decoration: BoxDecoration(
//             color: AppColors.primaryLight,
//             shape: BoxShape.circle,
//           ),
//           child: Icon(Icons.person_outline,
//               size: 20.sp, color: AppColors.primary),
//         ),
//       ],
//     );
//   }
// }

// // ── Stats row ────────────────────────────────────────────────────────────────
// class _StatsRow extends StatelessWidget {
//   final DashboardController ctrl;
//   const _StatsRow({required this.ctrl});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Row(
//           children: [
//             Expanded(
//               child: _StatCard(
//                 label: 'Low Stock Items',
//                 value: '${ctrl.lowStockItems.value}',
//                 subtitle: 'Items need restock',
//                 valueColor: AppColors.error,
//                 icon: Icons.inventory_2_outlined,
//                 iconBgColor: AppColors.redIconBg,
//                 iconColor: AppColors.error,
//               ),
//             ),
//             SizedBox(width: 12.w),
//             Expanded(
//               child: _StatCard(
//                 label: 'Total Orders',
//                 value: '${ctrl.totalOrdersToday.value}',
//                 subtitle: 'Today',
//                 valueColor: AppColors.primary,
//                 icon: Icons.shopping_cart_outlined,
//                 iconBgColor: AppColors.indigoIconBg,
//                 iconColor: AppColors.primary,
//               ),
//             ),
//           ],
//         ));
//   }
// }

// class _StatCard extends StatelessWidget {
//   final String label;
//   final String value;
//   final String subtitle;
//   final Color valueColor;
//   final IconData icon;
//   final Color iconBgColor;
//   final Color iconColor;

//   const _StatCard({
//     required this.label,
//     required this.value,
//     required this.subtitle,
//     required this.valueColor,
//     required this.icon,
//     required this.iconBgColor,
//     required this.iconColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.w),
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         borderRadius: BorderRadius.circular(16.r),
//         boxShadow: AppShadows.sm,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label,
//               style: AppTextStyle.labelSmall(color: AppColors.textSecondary)),
//           SizedBox(height: 8.h),
//           Text(value,
//               style: AppTextStyle.h1(color: valueColor)),
//           SizedBox(height: 4.h),
//           Text(subtitle,
//               style: AppTextStyle.caption(color: AppColors.textTertiary)),
//         ],
//       ),
//     );
//   }
// }

// // ── Quick actions ─────────────────────────────────────────────────────────────
// class _QuickActions extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Quick Actions', style: AppTextStyle.h4()),
//         SizedBox(height: 14.h),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _QuickAction(
//               icon: Icons.add,
//               label: 'New Order',
//               color: AppColors.primary,
//               bgColor: AppColors.indigoIconBg,
//               onTap: () => Get.toNamed('/create-order'),
//             ),
//             _QuickAction(
//               icon: Icons.receipt_outlined,
//               label: 'New Invoice',
//               color: AppColors.info,
//               bgColor: AppColors.blueIconBg,
//               onTap: () {},
//             ),
//             _QuickAction(
//               icon: Icons.inventory_outlined,
//               label: 'Add Product',
//               color: AppColors.textSecondary,
//               bgColor: AppColors.grayIconBg,
//               onTap: () {},
//             ),
//             _QuickAction(
//               icon: Icons.person_add_outlined,
//               label: 'Add Account',
//               color: AppColors.success,
//               bgColor: AppColors.greenIconBg,
//               onTap: () => Get.toNamed('/add-account'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class _QuickAction extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color color;
//   final Color bgColor;
//   final VoidCallback onTap;

//   const _QuickAction({
//     required this.icon,
//     required this.label,
//     required this.color,
//     required this.bgColor,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Container(
//             width: 56.w,
//             height: 56.h,
//             decoration: BoxDecoration(
//               color: bgColor,
//               borderRadius: BorderRadius.circular(14.r),
//               boxShadow: AppShadows.xs,
//             ),
//             child: Icon(icon, size: 24.sp, color: color),
//           ),
//           SizedBox(height: 6.h),
//           Text(label,
//               style: AppTextStyle.caption(color: AppColors.textSecondary),
//               textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }
// }

// // ── Recent activities ─────────────────────────────────────────────────────────
// class _RecentActivities extends StatelessWidget {
//   final DashboardController ctrl;
//   const _RecentActivities({required this.ctrl});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Recent Activities', style: AppTextStyle.h4()),
//             GestureDetector(
//               onTap: () {},
//               child: Text('View All',
//                   style: AppTextStyle.labelSmall(color: AppColors.primary)),
//             ),
//           ],
//         ),
//         SizedBox(height: 12.h),
//         Obx(() => Container(
//               decoration: BoxDecoration(
//                 color: AppColors.surface,
//                 borderRadius: BorderRadius.circular(16.r),
//                 boxShadow: AppShadows.sm,
//               ),
//               child: ListView.separated(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: ctrl.recentActivities.length,
//                 separatorBuilder: (_, __) =>
//                     const Divider(color: AppColors.divider, height: 1),
//                 itemBuilder: (_, i) =>
//                     _ActivityTile(activity: ctrl.recentActivities[i]),
//               ),
//             )),
//       ],
//     );
//   }
// }

// class _ActivityTile extends StatelessWidget {
//   final RecentActivity activity;
//   const _ActivityTile({required this.activity});

//   @override
//   Widget build(BuildContext context) {
//     final cfg = activityConfig(activity.type);

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
//       child: Row(
//         children: [
//           Container(
//             width: 40.w,
//             height: 40.h,
//             decoration: BoxDecoration(
//               color: cfg['bg'] as Color,
//               borderRadius: BorderRadius.circular(12.r),
//             ),
//             child: Icon(cfg['icon'] as IconData,
//                 size: 18.sp, color: cfg['color'] as Color),
//           ),
//           SizedBox(width: 12.w),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(activity.title, style: AppTextStyle.bodyMedium()),
//                 SizedBox(height: 2.h),
//                 Text(activity.subtitle,
//                     style: AppTextStyle.caption(
//                         color: AppColors.textTertiary)),
//                 SizedBox(height: 2.h),
//                 Text(activity.timeAgo,
//                     style: AppTextStyle.caption(
//                         color: AppColors.textDisabled)),
//               ],
//             ),
//           ),
//           if (activity.amount != null)
//             Text(
//               '₹${activity.amount!.toStringAsFixed(0)}',
//               style: AppTextStyle.bodyLargeMedium(color: AppColors.textPrimary),
//             )
//           else
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
//               decoration: BoxDecoration(
//                 color: AppColors.warningLight,
//                 borderRadius: BorderRadius.circular(999.r),
//               ),
//               child: Text('3 items',
//                   style: AppTextStyle.labelSmall(
//                       color: AppColors.warningDark)),
//             ),
//         ],
//       ),
//     );
//   }

//  }