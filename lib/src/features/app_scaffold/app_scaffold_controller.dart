import 'package:finstock/src/routes/app_routes.dart';
import 'package:get/get.dart';
import '../../core/constant/app_strings.dart';

class AppScaffoldController extends GetxController {
  final Rx<int> currentIndex = 0.obs;

  final List<String> title = [
    AppStrings.dashboard,
    AppStrings.orders,
    AppStrings.stock,
    AppStrings.accounts,
    AppStrings.profile,
  ];

  final List<String> routes = [
    AppRoutes.dashBoradPage,
    AppRoutes.ordersPage,
    AppRoutes.stockPage,
    AppRoutes.accountsPage,
    AppRoutes.profilePage,
  ];

  void onSelectedIndex(int tabIndex) {
    if (tabIndex < 0 || tabIndex >= routes.length) return;
    currentIndex.value = tabIndex;
    Get.rootDelegate.toNamed(routes[tabIndex]);
  }
}
