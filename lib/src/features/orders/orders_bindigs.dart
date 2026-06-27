import 'package:finstock/src/features/orders/orders_controller.dart';
import 'package:get/get.dart';

class OrdersBindigs extends Bindings {
  @override
  void dependencies() {
    Get.put(OrdersController());
  }
}
