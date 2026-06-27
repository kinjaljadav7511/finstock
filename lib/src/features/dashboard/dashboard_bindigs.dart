import 'package:finstock/src/features/dashboard/dashboard_controller.dart';
import 'package:get/instance_manager.dart';

class DashboardBindigs extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
