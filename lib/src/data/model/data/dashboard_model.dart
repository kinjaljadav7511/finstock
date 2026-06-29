// ─── Dashboard Models & Dummy Data ───────────────────────────────────────────



import '../../../core/enum/enum.dart';

class RecentActivity {
  final String id;
  final String title;
  final String subtitle;
  final String timeAgo;
  final double? amount;
  final ActivityType type;

  const RecentActivity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.timeAgo,
    this.amount,
    required this.type,
  });
}

class DashboardDummyData {
  static const int lowStockItems = 8;
  static const int totalOrdersToday = 24;

  static const List<RecentActivity> activities = [
    RecentActivity(
      id: 'act_001',
      title: 'Rajesh Kumar',
      subtitle: 'New order created',
      timeAgo: '10 mins ago',
      amount: 2340,
      type: ActivityType.order,
    ),
    RecentActivity(
      id: 'act_002',
      title: 'Priya Sharma',
      subtitle: 'Payment received',
      timeAgo: '25 mins ago',
      amount: 5600,
      type: ActivityType.payment,
    ),
    RecentActivity(
      id: 'act_003',
      title: 'Amit Patel',
      subtitle: 'Order completed',
      timeAgo: '1 hour ago',
      amount: 1280,
      type: ActivityType.completed,
    ),
    RecentActivity(
      id: 'act_004',
      title: 'Stock Alert',
      subtitle: 'Low stock warning',
      timeAgo: '2 hours ago',
      amount: null,
      type: ActivityType.stockAlert,
    ),
    RecentActivity(
      id: 'act_005',
      title: 'Sneha Reddy',
      subtitle: 'New order created',
      timeAgo: '3 hours ago',
      amount: 890,
      type: ActivityType.order,
    ),
  ];
}