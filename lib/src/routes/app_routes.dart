import 'package:finstock/src/features/accounts/account_bindigs.dart';
import 'package:finstock/src/features/accounts/account_page.dart';
import 'package:finstock/src/features/app_scaffold/app_scaffold_bindigs.dart';
import 'package:finstock/src/features/app_scaffold/app_scaffold_page.dart';
import 'package:finstock/src/features/dashboard/dashboard_bindigs.dart';
import 'package:finstock/src/features/dashboard/dashboard_page.dart';
import 'package:finstock/src/features/orders/orders_bindigs.dart';
import 'package:finstock/src/features/orders/orders_page.dart';
import 'package:finstock/src/features/profile/profile_bindigs.dart';
import 'package:finstock/src/features/profile/profile_page.dart';
import 'package:finstock/src/features/stock/stock_bindigs.dart';
import 'package:finstock/src/features/stock/stock_page.dart';
import 'package:get/route_manager.dart';
class AppRoutes {
  static const String scaffoldPage = "/scaffold";
  static const String dashBoradPage = "/scaffold/dashboard";
  static const String ordersPage = "/scaffold/orders";
  static const String stockPage = "/scaffold/stock";
  static const String accountsPage = "/scaffold/accounts";
  static const String profilePage = "/scaffold/profile";

  static final routes = [
    GetPage(
      name: scaffoldPage,
      page: () => AppScaffoldPage(),
      binding: AppScaffoldBindigs(),

      children: [
        GetPage(
          name: '/dashboard',
          page: () => DashboardPage(),
          binding: DashboardBindigs(),
        ),
        GetPage(
          name: '/orders',
          page: () => OrdersPage(),
          binding: OrdersBindigs(),
        ),
        GetPage(
          name: '/stock',
          page: () => StockPage(),
          binding: StockBindigs(),
        ),
        GetPage(
          name: '/accounts',
          page: () => AccountPage(),
          binding: AccountBindigs(),
        ),
        GetPage(
          name: '/profile',
          page: () => ProfilePage(),
          binding: ProfileBindigs(),
        ),
      ],
    ),
  ];
}
