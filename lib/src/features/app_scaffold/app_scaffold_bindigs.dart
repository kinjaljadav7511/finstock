import 'package:finstock/src/features/app_scaffold/app_scaffold_controller.dart';
import 'package:get/get.dart';

class AppScaffoldBindigs extends Bindings {
  @override
  void dependencies() {
    Get.put(AppScaffoldController());
  }
}
