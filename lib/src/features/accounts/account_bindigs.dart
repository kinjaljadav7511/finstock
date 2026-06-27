import 'package:finstock/src/features/accounts/account_controller.dart';
import 'package:get/instance_manager.dart';

class AccountBindigs extends Bindings {
  @override
  void dependencies() {
    Get.put(AccountController());
  }
}
