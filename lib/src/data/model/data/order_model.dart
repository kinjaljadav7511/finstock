// ─── Order Models & Dummy Data ────────────────────────────────────────────────

enum OrderStatus { pending, processing, completed, cancelled }

class OrderItem {
  final String productId;
  final String productName;
  final int quantity;
  final double price;

  const OrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
  });

  double get total => quantity * price;
}

class OrderModel {
  final String id;
  final String orderId;
  final String customerName;
  final List<OrderItem> items;
  final String time;
  final double subtotal;
  final double discount;
  final double tax;
  final double total;
  final OrderStatus status;
  final DateTime createdAt;

  const OrderModel({
    required this.id,
    required this.orderId,
    required this.customerName,
    required this.items,
    required this.time,
    required this.subtotal,
    required this.discount,
    required this.tax,
    required this.total,
    required this.status,
    required this.createdAt,
  });

  int get itemCount => items.fold(0, (sum, i) => sum + i.quantity);
}

class OrderDummyData {
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'o1',
      orderId: 'ORD-001',
      customerName: 'Rajesh Kumar',
      items: const [
        OrderItem(productId: 'p1', productName: 'Marker Set', quantity: 3, price: 350),
        OrderItem(productId: 'p2', productName: 'Stapler Heavy Duty', quantity: 2, price: 450),
      ],
      time: '10:30 AM',
      subtotal: 1950,
      discount: 0,
      tax: 18,
      total: 2301,
      status: OrderStatus.pending,
      createdAt: DateTime.now(),
    ),
    OrderModel(
      id: 'o2',
      orderId: 'ORD-002',
      customerName: 'Vikram Singh',
      items: const [
        OrderItem(productId: 'p3', productName: 'Calculator', quantity: 5, price: 850),
        OrderItem(productId: 'p4', productName: 'USB Flash Drive', quantity: 10, price: 450),
        OrderItem(productId: 'p5', productName: 'Paper Clips (Pack)', quantity: 20, price: 80),
      ],
      time: '09:15 AM',
      subtotal: 7350,
      discount: 5,
      tax: 18,
      total: 8232,
      status: OrderStatus.processing,
      createdAt: DateTime.now(),
    ),
    OrderModel(
      id: 'o3',
      orderId: 'ORD-003',
      customerName: 'Amit Patel',
      items: const [
        OrderItem(productId: 'p1', productName: 'Marker Set', quantity: 2, price: 350),
        OrderItem(productId: 'p6', productName: 'Notebook Bundle', quantity: 6, price: 120),
      ],
      time: '08:15 AM',
      subtotal: 1420,
      discount: 10,
      tax: 18,
      total: 1280,
      status: OrderStatus.completed,
      createdAt: DateTime.now(),
    ),
    OrderModel(
      id: 'o4',
      orderId: 'ORD-004',
      customerName: 'Sneha Reddy',
      items: const [
        OrderItem(productId: 'p2', productName: 'Stapler Heavy Duty', quantity: 2, price: 450),
      ],
      time: '05:20 PM',
      subtotal: 900,
      discount: 0,
      tax: 18,
      total: 890,
      status: OrderStatus.cancelled,
      createdAt: DateTime.now(),
    ),
    OrderModel(
      id: 'o5',
      orderId: 'ORD-005',
      customerName: 'Vikram Singh',
      items: const [
        OrderItem(productId: 'p3', productName: 'Calculator', quantity: 8, price: 850),
        OrderItem(productId: 'p4', productName: 'USB Flash Drive', quantity: 5, price: 450),
        OrderItem(productId: 'p5', productName: 'Paper Clips (Pack)', quantity: 15, price: 80),
        OrderItem(productId: 'p6', productName: 'Notebook Bundle', quantity: 10, price: 120),
      ],
      time: '03:10 PM',
      subtotal: 9750,
      discount: 0,
      tax: 18,
      total: 8950,
      status: OrderStatus.processing,
      createdAt: DateTime.now(),
    ),
    OrderModel(
      id: 'o6',
      orderId: 'ORD-006',
      customerName: 'Anjali Verma',
      items: const [
        OrderItem(productId: 'p1', productName: 'Marker Set', quantity: 4, price: 350),
      ],
      time: '02:30 PM',
      subtotal: 1400,
      discount: 0,
      tax: 18,
      total: 1400,
      status: OrderStatus.pending,
      createdAt: DateTime.now(),
    ),
  ];
}