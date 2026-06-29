import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/enum/enum.dart';
import '../../data/model/data/account_model.dart';
import '../../data/model/data/order_model.dart';
import '../../data/model/data/stock_model.dart';
import 'orders_controller.dart';
import 'package:finstock/src/theme/theme_export.dart';

// ===========================================================================
//  ORDERS LIST PAGE
// ===========================================================================
class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<OrderController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _OrdersHeader(),
            _OrderSearchBar(ctrl: ctrl),
            _OrderTabRow(ctrl: ctrl),
            SizedBox(height: 4.h),
            _OrderList(ctrl: ctrl),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const CreateOrderPage()),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}

class _OrdersHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Orders', style: AppTextStyle.h2()),
      ),
    );
  }
}

class _OrderSearchBar extends StatelessWidget {
  final OrderController ctrl;
  const _OrderSearchBar({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: TextField(
        onChanged: ctrl.updateSearch,
        style: AppTextStyle.bodyMedium(),
        decoration: InputDecoration(
          hintText: 'Search orders...',
          hintStyle: AppTextStyle.inputHint(),
          prefixIcon: Icon(
            Icons.search,
            size: 20.sp,
            color: AppColors.textTertiary,
          ),
          filled: true,
          fillColor: AppColors.surface,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _OrderTabRow extends StatelessWidget {
  final OrderController ctrl;
  const _OrderTabRow({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    final tabs = ['All', 'Pending', 'Processing', 'Completed'];
    return SizedBox(
      height: 38.h,
      child: Obx(
        () => ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: tabs.length,
          separatorBuilder: (_, __) => SizedBox(width: 8.w),
          itemBuilder: (_, i) {
            final selected = ctrl.selectedTab.value == i;
            return GestureDetector(
              onTap: () => ctrl.selectTab(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: selected ? AppColors.primary : AppColors.surface,
                  borderRadius: BorderRadius.circular(999.r),
                  boxShadow: selected ? AppShadows.sm : AppShadows.xs,
                ),
                child: Text(
                  tabs[i],
                  style: AppTextStyle.labelSmall(
                    color: selected ? AppColors.white : AppColors.textSecondary,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _OrderList extends StatelessWidget {
  final OrderController ctrl;
  const _OrderList({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final list = ctrl.filteredOrders;
        if (list.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.receipt_long_outlined,
                  size: 48.sp,
                  color: AppColors.textDisabled,
                ),
                SizedBox(height: 12.h),
                Text(
                  'No orders found',
                  style: AppTextStyle.bodyMedium(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          );
        }
        return ListView.separated(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 100.h),
          itemCount: list.length,
          separatorBuilder: (_, __) => SizedBox(height: 10.h),
          itemBuilder: (_, i) => _OrderCard(order: list[i]),
        );
      }),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final OrderModel order;
  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    final statusCfg = _statusConfig(order.status);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: AppShadows.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.orderId, style: AppTextStyle.bodyLargeMedium()),
                    SizedBox(height: 2.h),
                    Text(
                      order.customerName,
                      style: AppTextStyle.bodySmall(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              _StatusBadge(label: statusCfg['label']!, colors: statusCfg),
            ],
          ),
          SizedBox(height: 12.h),
          const Divider(color: AppColors.divider, height: 1),
          SizedBox(height: 12.h),
          Row(
            children: [
              Text(
                '${order.itemCount} items',
                style: AppTextStyle.bodySmall(color: AppColors.textSecondary),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 4.w,
                height: 4.h,
                decoration: const BoxDecoration(
                  color: AppColors.textDisabled,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                order.time,
                style: AppTextStyle.bodySmall(color: AppColors.textSecondary),
              ),
              const Spacer(),
              Text(
                '₹${order.total.toStringAsFixed(0)}',
                style: AppTextStyle.bodyLargeMedium(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Map<String, String> _statusConfig(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return {'label': 'Pending', 'bg': 'warning', 'text': 'warningDark'};
      case OrderStatus.processing:
        return {'label': 'Processing', 'bg': 'info', 'text': 'infoDark'};
      case OrderStatus.completed:
        return {'label': 'Completed', 'bg': 'success', 'text': 'successDark'};
      case OrderStatus.cancelled:
        return {'label': 'Cancelled', 'bg': 'error', 'text': 'errorDark'};
    }
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final Map<String, String> colors;
  const _StatusBadge({required this.label, required this.colors});

  @override
  Widget build(BuildContext context) {
    Color bg, text;
    switch (colors['bg']) {
      case 'warning':
        bg = AppColors.warningLight;
        text = AppColors.warningDark;
        break;
      case 'info':
        bg = AppColors.infoLight;
        text = AppColors.infoDark;
        break;
      case 'success':
        bg = AppColors.successLight;
        text = AppColors.successDark;
        break;
      default:
        bg = AppColors.errorLight;
        text = AppColors.errorDark;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999.r),
      ),
      child: Text(label, style: AppTextStyle.labelSmall(color: text)),
    );
  }
}

// ===========================================================================
//  CREATE ORDER PAGE
// ===========================================================================
class CreateOrderPage extends StatelessWidget {
  const CreateOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<OrderController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 18.sp,
            color: AppColors.textPrimary,
          ),
          onPressed: () {
            ctrl.resetCreateForm();
            Get.back();
          },
        ),
        title: Text('Create Order', style: AppTextStyle.h3()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Customer selector
            _SectionCard(
              children: [
                Text('Select Customer', style: AppTextStyle.labelMedium()),
                SizedBox(height: 10.h),
                _CustomerDropdown(ctrl: ctrl),
              ],
            ),
            SizedBox(height: 16.h),

            // Order items
            _SectionCard(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Order Items', style: AppTextStyle.labelLarge()),
                    GestureDetector(
                      onTap: () => _showProductPicker(context, ctrl),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 16.sp,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'Add Product',
                            style: AppTextStyle.labelSmall(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                Obx(() {
                  if (ctrl.cartItems.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        child: Column(
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 36.sp,
                              color: AppColors.textDisabled,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'No items added yet',
                              style: AppTextStyle.bodySmall(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            GestureDetector(
                              onTap: () => _showProductPicker(context, ctrl),
                              child: Text(
                                'Add your first product',
                                style: AppTextStyle.labelSmall(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Column(
                    children: ctrl.cartItems
                        .map((item) => _CartItemTile(item: item, ctrl: ctrl))
                        .toList(),
                  );
                }),
              ],
            ),
            SizedBox(height: 16.h),

            // Discount & Tax
            _SectionCard(
              children: [
                _NumericField(
                  label: 'Discount (%)',
                  initialValue: '0',
                  onChanged: (v) =>
                      ctrl.discount.value = double.tryParse(v) ?? 0,
                ),
                SizedBox(height: 14.h),
                _NumericField(
                  label: 'Tax (%)',
                  initialValue: '18',
                  onChanged: (v) =>
                      ctrl.taxPercent.value = double.tryParse(v) ?? 18,
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Summary
            Obx(() => _OrderSummary(ctrl: ctrl)),
            SizedBox(height: 24.h),

            // Create button
            Obx(() {
              final canCreate =
                  ctrl.selectedCustomer.value != null &&
                  ctrl.cartItems.isNotEmpty;
              return SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: canCreate
                      ? () {
                          ctrl.createOrder();
                          Get.back();
                          Get.snackbar(
                            'Order created',
                            'New order added successfully.',
                            backgroundColor: AppColors.success,
                            colorText: AppColors.white,
                            snackPosition: SnackPosition.TOP,
                            margin: EdgeInsets.all(16.w),
                            borderRadius: 12.r,
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: AppColors.gray300,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  child: Text(
                    'Create Order',
                    style: AppTextStyle.buttonLarge(color: AppColors.white),
                  ),
                ),
              );
            }),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  void _showProductPicker(BuildContext context, OrderController ctrl) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => _ProductPickerSheet(ctrl: ctrl),
    );
  }
}

class _CustomerDropdown extends StatelessWidget {
  final OrderController ctrl;
  const _CustomerDropdown({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    final customers = AccountDummyData.accounts
        .where((a) => a.isCustomer)
        .toList();

    return Obx(
      () => DropdownButtonFormField<AccountModel>(
        value: ctrl.selectedCustomer.value,
        hint: Text('Choose a customer', style: AppTextStyle.inputHint()),
        style: AppTextStyle.bodyMedium(),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.inputBackground,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 12.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: AppColors.inputBorder,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: AppColors.inputBorder,
              width: 1,
            ),
          ),
        ),
        items: customers
            .map(
              (c) => DropdownMenuItem(
                value: c,
                child: Text(c.name, style: AppTextStyle.bodyMedium()),
              ),
            )
            .toList(),
        onChanged: (v) => ctrl.selectedCustomer.value = v,
      ),
    );
  }
}

class _CartItemTile extends StatelessWidget {
  final dynamic item;
  final OrderController ctrl;
  const _CartItemTile({required this.item, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.product.name, style: AppTextStyle.bodyMedium()),
                SizedBox(height: 2.h),
                Text(
                  '₹${item.product.price.toStringAsFixed(0)} each',
                  style: AppTextStyle.caption(color: AppColors.textTertiary),
                ),
              ],
            ),
          ),
          // Qty controls
          Row(
            children: [
              _QtyButton(
                icon: Icons.remove,
                onTap: () => ctrl.updateQty(item.product.id, item.quantity - 1),
              ),
              SizedBox(width: 10.w),
              Text('${item.quantity}', style: AppTextStyle.bodyLargeMedium()),
              SizedBox(width: 10.w),
              _QtyButton(
                icon: Icons.add,
                onTap: () => ctrl.updateQty(item.product.id, item.quantity + 1),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          Text(
            '₹${(item.product.price * item.quantity).toStringAsFixed(0)}',
            style: AppTextStyle.bodyMedium(),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () => ctrl.removeProduct(item.product.id),
            child: Icon(
              Icons.close,
              size: 16.sp,
              color: AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: AppColors.gray100,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, size: 14.sp, color: AppColors.textPrimary),
      ),
    );
  }
}

class _ProductPickerSheet extends StatelessWidget {
  final OrderController ctrl;
  const _ProductPickerSheet({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    final products = StockDummyData.products;
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.gray200,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text('Select Product', style: AppTextStyle.h3()),
          SizedBox(height: 12.h),
          Expanded(
            child: ListView.separated(
              itemCount: products.length,
              separatorBuilder: (_, __) =>
                  const Divider(color: AppColors.divider, height: 1),
              itemBuilder: (_, i) {
                final p = products[i];
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 4.h,
                  ),
                  title: Text(p.name, style: AppTextStyle.bodyMedium()),
                  subtitle: Text(
                    '${p.category} • Qty: ${p.quantity}',
                    style: AppTextStyle.caption(color: AppColors.textTertiary),
                  ),
                  trailing: Text(
                    '₹${p.price.toStringAsFixed(0)}',
                    style: AppTextStyle.bodyLargeMedium(
                      color: AppColors.primary,
                    ),
                  ),
                  onTap: () {
                    ctrl.addProduct(p);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderSummary extends StatelessWidget {
  final OrderController ctrl;
  const _OrderSummary({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: AppShadows.sm,
      ),
      child: Column(
        children: [
          _SummaryRow(
            label: 'Subtotal',
            value: '₹${ctrl.subtotal.toStringAsFixed(2)}',
          ),
          SizedBox(height: 8.h),
          _SummaryRow(
            label: 'Tax (${ctrl.taxPercent.value.toStringAsFixed(0)}%)',
            value: '₹${ctrl.taxAmount.toStringAsFixed(2)}',
          ),
          SizedBox(height: 8.h),
          if (ctrl.discount.value > 0) ...[
            _SummaryRow(
              label: 'Discount (${ctrl.discount.value.toStringAsFixed(0)}%)',
              value: '-₹${ctrl.discountAmount.toStringAsFixed(2)}',
              valueColor: AppColors.success,
            ),
            SizedBox(height: 8.h),
          ],
          const Divider(color: AppColors.divider),
          SizedBox(height: 8.h),
          _SummaryRow(
            label: 'Total',
            value: '₹${ctrl.total.toStringAsFixed(2)}',
            isBold: true,
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final Color? valueColor;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isBold
              ? AppTextStyle.bodyLargeMedium()
              : AppTextStyle.bodySmall(color: AppColors.textSecondary),
        ),
        Text(
          value,
          style: isBold
              ? AppTextStyle.bodyLargeMedium()
              : AppTextStyle.bodySmall(
                  color: valueColor ?? AppColors.textSecondary,
                ),
        ),
      ],
    );
  }
}

// ── Shared widgets ────────────────────────────────────────────────────────────
class _SectionCard extends StatelessWidget {
  final List<Widget> children;
  const _SectionCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: AppShadows.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class _NumericField extends StatelessWidget {
  final String label;
  final String initialValue;
  final ValueChanged<String> onChanged;

  const _NumericField({
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.labelMedium(color: AppColors.textPrimary),
        ),
        SizedBox(height: 6.h),
        TextFormField(
          initialValue: initialValue,
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          style: AppTextStyle.bodyMedium(),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.inputBackground,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 12.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.inputBorder,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.inputBorder,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: AppColors.focusRing,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
