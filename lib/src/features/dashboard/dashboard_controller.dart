import 'package:finstock/src/core/constant/app_strings.dart';
import 'package:get/state_manager.dart';

class DashboardController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final List<String> title = [
    AppStrings.dashboard,
    AppStrings.orders,
    AppStrings.stock,
    AppStrings.accounts,
    AppStrings.profile,
  ];

  final List<String> routes = [
    
  ];
}
