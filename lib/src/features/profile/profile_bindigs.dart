import 'package:finstock/src/features/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBindigs extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
