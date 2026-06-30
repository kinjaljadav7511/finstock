import 'package:finstock/src/core/constant/app_strings.dart';
import 'package:finstock/src/features/dashboard/dashboard_controller.dart';
import 'package:finstock/src/features/dashboard/widget/action_card.dart';
import 'package:finstock/src/features/widget/app_listtile.dart';
import 'package:finstock/src/features/widget/icon_container.dart';
import 'package:finstock/src/features/widget/metric_card.dart';
import 'package:finstock/src/theme/theme_export.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import '../../data/model/ui/activity_config.dart';
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
                  size: AppSpacing.iconSize20,
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
              AppSpacing.vGap8,
              Column(
                spacing: 6,
                children: [
                  Row(
                    children: [
                      Text(AppStrings.recentActivities),
                      Spacer(),
                      AppTextButton(onTap: () {}, title: AppStrings.viewAll),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final activity = controller.recentActivities[index];
                      final cfg = activityStatus(activity.type);

                      return AppListtile(
                        bgColor: AppColors.gray50,
                        title: activity.title,
                        trailing: Text(
                          activity.amount == null
                              ? "${controller.lowStockItems.string} items"
                              : "₹${activity.amount.toString()}",
                        ),
                        leading: IconContainer(
                          size: 40,
                          iconSize: AppSpacing.iconSize16,
                          icon: cfg.icon,
                          backgroundColor: cfg.bgColor,
                          iconColor: cfg.iconColor,
                        ),
                        subtitle: Column(
                          //spacing: 3,
                          crossAxisAlignment: .start,
                          mainAxisAlignment: .start,
                          mainAxisSize: .min,
                          children: [
                            Text(
                              activity.subtitle,
                              style: AppTextStyle.bodySmall(),
                            ),
                            Text(
                              activity.timeAgo,
                              style: AppTextStyle.bodySmall(),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 6);
                    },
                    itemCount: controller.recentActivities.length,
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
