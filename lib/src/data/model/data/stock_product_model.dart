// ─── Stock Models & Dummy Data ────────────────────────────────────────────────
import '../../../core/enum/enum.dart';

class StockProduct {
  final String id;
  final String name;
  final String category;
  final StockCategory categoryEnum;
  final int quantity;
  final double price;
  final int lowStockThreshold;

  const StockProduct({
    required this.id,
    required this.name,
    required this.category,
    required this.categoryEnum,
    required this.quantity,
    required this.price,
    required this.lowStockThreshold,
  });

  bool get isLowStock => quantity <= lowStockThreshold;
}

class StockDummyData {
  static const List<StockProduct> products = [
    StockProduct(
      id: 'p1',
      name: 'Marker Set',
      category: 'Stationery',
      categoryEnum: StockCategory.stationery,
      quantity: 20,
      price: 350,
      lowStockThreshold: 5,
    ),
    StockProduct(
      id: 'p2',
      name: 'Stapler Heavy Duty',
      category: 'Office Supplies',
      categoryEnum: StockCategory.officeSupplies,
      quantity: 5,
      price: 450,
      lowStockThreshold: 6,
    ),
    StockProduct(
      id: 'p3',
      name: 'Paper Clips (Pack)',
      category: 'Office Supplies',
      categoryEnum: StockCategory.officeSupplies,
      quantity: 100,
      price: 80,
      lowStockThreshold: 10,
    ),
    StockProduct(
      id: 'p4',
      name: 'Calculator',
      category: 'Electronics',
      categoryEnum: StockCategory.electronics,
      quantity: 12,
      price: 850,
      lowStockThreshold: 5,
    ),
    StockProduct(
      id: 'p5',
      name: 'USB Flash Drive',
      category: 'Electronics',
      categoryEnum: StockCategory.electronics,
      quantity: 3,
      price: 450,
      lowStockThreshold: 5,
    ),
    StockProduct(
      id: 'p6',
      name: 'Notebook Bundle',
      category: 'Stationery',
      categoryEnum: StockCategory.stationery,
      quantity: 45,
      price: 120,
      lowStockThreshold: 10,
    ),
    StockProduct(
      id: 'p7',
      name: 'Ballpoint Pens (Box)',
      category: 'Stationery',
      categoryEnum: StockCategory.stationery,
      quantity: 4,
      price: 200,
      lowStockThreshold: 5,
    ),
    StockProduct(
      id: 'p8',
      name: 'File Folders (Pack)',
      category: 'Office Supplies',
      categoryEnum: StockCategory.officeSupplies,
      quantity: 30,
      price: 180,
      lowStockThreshold: 8,
    ),
    StockProduct(
      id: 'p9',
      name: 'Wireless Mouse',
      category: 'Electronics',
      categoryEnum: StockCategory.electronics,
      quantity: 7,
      price: 1200,
      lowStockThreshold: 3,
    ),
    StockProduct(
      id: 'p10',
      name: 'Sticky Notes (Pack)',
      category: 'Stationery',
      categoryEnum: StockCategory.stationery,
      quantity: 2,
      price: 95,
      lowStockThreshold: 5,
    ),
  ];
}