import 'package:finstock/src/features/stock/stock_controller.dart';
import 'package:get/get.dart';

class StockBindigs extends Bindings {
  @override
  void dependencies() {
    Get.put(StockController());
  }
}
