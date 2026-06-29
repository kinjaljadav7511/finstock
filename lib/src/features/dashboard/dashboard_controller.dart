// import 'package:finstock/src/core/constant/app_strings.dart';
// import 'package:get/state_manager.dart';

// class DashboardController extends GetxController {
//   final RxInt currentIndex = 0.obs;

//   final List<String> title = [
//     AppStrings.dashboard,
//     AppStrings.orders,
//     AppStrings.stock,
//     AppStrings.accounts,
//     AppStrings.profile,
//   ];

//   final List<String> routes = [
    
//   ];
// }

import 'package:get/get.dart';

import '../../data/model/data/dashboard_model.dart';


class DashboardController extends GetxController {
  final RxInt lowStockItems = DashboardDummyData.lowStockItems.obs;
  final RxInt totalOrdersToday = DashboardDummyData.totalOrdersToday.obs;
  final RxList<RecentActivity> recentActivities =
      RxList(List.from(DashboardDummyData.activities));
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Simulate refresh
  }

  void refresh() {
    isLoading.value = true;
    Future.delayed(const Duration(milliseconds: 800), () {
      isLoading.value = false;
    });
  }
}