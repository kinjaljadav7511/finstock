import 'package:finstock/src/core/constant/app_strings.dart';
import 'package:finstock/src/features/app_scaffold/app_scaffold_controller.dart';
import 'package:finstock/src/features/widget/app_bar.dart';
import 'package:finstock/src/routes/app_routes.dart';
import 'package:finstock/src/theme/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/nav2/router_outlet.dart';
import 'package:get/state_manager.dart';

class AppScaffoldPage extends GetView<AppScaffoldController> {
  const AppScaffoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: controller.title[controller.currentIndex.value],
      ),
      bottomNavigationBar: NavigationBar(
        height: AppSpacing.bottomNavHeight,
        indicatorColor: Colors.transparent,
        selectedIndex: controller.currentIndex.value,
        onDestinationSelected: controller.onSelectedIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            label: AppStrings.dashboard,
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: AppStrings.orders,
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            label: AppStrings.stock,
          ),
          NavigationDestination(
            icon: Icon(Icons.people_alt_outlined),
            label: AppStrings.accounts,
          ),
          NavigationDestination(
            icon: Icon(Icons.manage_accounts_outlined),
            label: AppStrings.profile,
          ),
        ],
      ),

      body: GetRouterOutlet(
        initialRoute: AppRoutes.dashBoradPage,
        anchorRoute: AppRoutes.scaffoldPage,
      ),
    );
  }
}
