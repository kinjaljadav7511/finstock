import 'package:get/get.dart';
import '../../data/model/data/account_model.dart';
import '../../data/model/data/order_model.dart';
import '../../data/model/data/stock_model.dart';


class OrderController extends GetxController {
  // List page
  final RxInt selectedTab = 0.obs; // 0=All,1=Pending,2=Processing,3=Completed
  final RxString searchQuery = ''.obs;
  final RxList<OrderModel> orders =
      RxList(List.from(OrderDummyData.orders));

  // Create order page
  final Rx<AccountModel?> selectedCustomer = Rx(null);
  final RxList<_CartItem> cartItems = RxList([]);
  final RxDouble discount = 0.0.obs;
  final RxDouble taxPercent = 18.0.obs;

  List<OrderModel> get filteredOrders {
    List<OrderModel> list = orders;
    switch (selectedTab.value) {
      case 1:
        list = list.where((o) => o.status == OrderStatus.pending).toList();
        break;
      case 2:
        list = list.where((o) => o.status == OrderStatus.processing).toList();
        break;
      case 3:
        list = list.where((o) => o.status == OrderStatus.completed).toList();
        break;
    }
    final q = searchQuery.value.toLowerCase().trim();
    if (q.isNotEmpty) {
      list = list
          .where((o) =>
              o.customerName.toLowerCase().contains(q) ||
              o.orderId.toLowerCase().contains(q))
          .toList();
    }
    return list;
  }

  void selectTab(int i) => selectedTab.value = i;
  void updateSearch(String q) => searchQuery.value = q;

  // Cart operations
  void addProduct(StockProduct product) {
    final idx = cartItems.indexWhere((c) => c.product.id == product.id);
    if (idx >= 0) {
      cartItems[idx] = _CartItem(
        product: cartItems[idx].product,
        quantity: cartItems[idx].quantity + 1,
      );
    } else {
      cartItems.add(_CartItem(product: product, quantity: 1));
    }
    cartItems.refresh();
  }

  void removeProduct(String productId) {
    cartItems.removeWhere((c) => c.product.id == productId);
  }

  void updateQty(String productId, int qty) {
    if (qty <= 0) {
      removeProduct(productId);
      return;
    }
    final idx = cartItems.indexWhere((c) => c.product.id == productId);
    if (idx >= 0) {
      cartItems[idx] = _CartItem(product: cartItems[idx].product, quantity: qty);
      cartItems.refresh();
    }
  }

  double get subtotal =>
      cartItems.fold(0, (s, c) => s + c.product.price * c.quantity);
  double get taxAmount => subtotal * (taxPercent.value / 100);
  double get discountAmount => subtotal * (discount.value / 100);
  double get total => subtotal - discountAmount + taxAmount;

  void resetCreateForm() {
    selectedCustomer.value = null;
    cartItems.clear();
    discount.value = 0;
    taxPercent.value = 18;
  }

  void createOrder() {
    if (selectedCustomer.value == null || cartItems.isEmpty) return;
    final newOrder = OrderModel(
      id: 'o${orders.length + 1}',
      orderId: 'ORD-00${orders.length + 1}',
      customerName: selectedCustomer.value!.name,
      items: cartItems
          .map((c) => OrderItem(
                productId: c.product.id,
                productName: c.product.name,
                quantity: c.quantity,
                price: c.product.price,
              ))
          .toList(),
      time: _formatTime(DateTime.now()),
      subtotal: subtotal,
      discount: discount.value,
      tax: taxPercent.value,
      total: total,
      status: OrderStatus.pending,
      createdAt: DateTime.now(),
    );
    orders.insert(0, newOrder);
    resetCreateForm();
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour > 12 ? dt.hour - 12 : dt.hour;
    final m = dt.minute.toString().padLeft(2, '0');
    final period = dt.hour >= 12 ? 'PM' : 'AM';
    return '$h:$m $period';
  }
}

class _CartItem {
  final StockProduct product;
  final int quantity;
  const _CartItem({required this.product, required this.quantity});
}