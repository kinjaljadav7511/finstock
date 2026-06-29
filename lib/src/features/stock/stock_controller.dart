import 'package:get/get.dart';
import '../../core/enum/enum.dart';
import '../../data/model/data/stock_model.dart';

class StockController extends GetxController {
  final RxInt selectedCategory =
      0.obs; // 0=All,1=Stationery,2=Office,3=Electronics
  final RxString searchQuery = ''.obs;
  final RxList<StockProduct> products = RxList(
    List.from(StockDummyData.products),
  );

  List<StockProduct> get filteredProducts {
    List<StockProduct> list = products;
    switch (selectedCategory.value) {
      case 1:
        list = list
            .where((p) => p.categoryEnum == StockCategory.stationery)
            .toList();
        break;
      case 2:
        list = list
            .where((p) => p.categoryEnum == StockCategory.officeSupplies)
            .toList();
        break;
      case 3:
        list = list
            .where((p) => p.categoryEnum == StockCategory.electronics)
            .toList();
        break;
    }
    final q = searchQuery.value.toLowerCase().trim();
    if (q.isNotEmpty) {
      list = list
          .where(
            (p) =>
                p.name.toLowerCase().contains(q) ||
                p.category.toLowerCase().contains(q),
          )
          .toList();
    }
    return list;
  }

  List<StockProduct> get lowStockProducts =>
      products.where((p) => p.isLowStock).toList();

  int get lowStockCount => lowStockProducts.length;

  void selectCategory(int i) => selectedCategory.value = i;
  void updateSearch(String q) => searchQuery.value = q;
}
