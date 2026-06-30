import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/enum/enum.dart';
import '../../data/model/data/stock_product_model.dart';
import 'stock_controller.dart';


import 'package:finstock/src/theme/theme_export.dart';

// ===========================================================================
//  STOCK MANAGEMENT PAGE
// ===========================================================================
class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<StockController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StockHeader(),
            _LowStockBanner(ctrl: ctrl),
            _StockSearchBar(ctrl: ctrl),
            _CategoryTabRow(ctrl: ctrl),
            SizedBox(height: 4.h),
            _ProductList(ctrl: ctrl),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddProductSheet(context, ctrl),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }

  void _showAddProductSheet(BuildContext context, StockController ctrl) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => const _AddProductSheet(),
    );
  }
}

class _StockHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
      child: Text('Stock Management', style: AppTextStyle.h2()),
    );
  }
}

// ── Low stock banner ──────────────────────────────────────────────────────────
class _LowStockBanner extends StatelessWidget {
  final StockController ctrl;
  const _LowStockBanner({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final count = ctrl.lowStockCount;
      if (count == 0) return const SizedBox.shrink();
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.errorLight,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.errorBorder),
          ),
          child: Row(
            children: [
              Icon(Icons.warning_amber_rounded,
                  size: 18.sp, color: AppColors.error),
              SizedBox(width: 8.w),
              Text(
                '$count items need restocking',
                style: AppTextStyle.labelMedium(color: AppColors.errorDark),
              ),
            ],
          ),
        ),
      );
    });
  }
}

// ── Search bar ────────────────────────────────────────────────────────────────
class _StockSearchBar extends StatelessWidget {
  final StockController ctrl;
  const _StockSearchBar({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: TextField(
        onChanged: ctrl.updateSearch,
        style: AppTextStyle.bodyMedium(),
        decoration: InputDecoration(
          hintText: 'Search products...',
          hintStyle: AppTextStyle.inputHint(),
          prefixIcon:
              Icon(Icons.search, size: 20.sp, color: AppColors.textTertiary),
          filled: true,
          fillColor: AppColors.surface,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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

// ── Category tabs ─────────────────────────────────────────────────────────────
class _CategoryTabRow extends StatelessWidget {
  final StockController ctrl;
  const _CategoryTabRow({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    final tabs = ['All', 'Stationery', 'Office Supplies', 'Electronics'];
    return SizedBox(
      height: 38.h,
      child: Obx(() => ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: tabs.length,
            separatorBuilder: (_, __) => SizedBox(width: 8.w),
            itemBuilder: (_, i) {
              final selected = ctrl.selectedCategory.value == i;
              return GestureDetector(
                onTap: () => ctrl.selectCategory(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.primary : AppColors.surface,
                    borderRadius: BorderRadius.circular(999.r),
                    boxShadow: selected ? AppShadows.sm : AppShadows.xs,
                  ),
                  child: Text(
                    tabs[i],
                    style: AppTextStyle.labelSmall(
                      color: selected
                          ? AppColors.white
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}

// ── Product list ──────────────────────────────────────────────────────────────
class _ProductList extends StatelessWidget {
  final StockController ctrl;
  const _ProductList({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final list = ctrl.filteredProducts;
        if (list.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.inventory_2_outlined,
                    size: 48.sp, color: AppColors.textDisabled),
                SizedBox(height: 12.h),
                Text('No products found',
                    style: AppTextStyle.bodyMedium(
                        color: AppColors.textSecondary)),
              ],
            ),
          );
        }
        return ListView.separated(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 100.h),
          itemCount: list.length,
          separatorBuilder: (_, __) => SizedBox(height: 10.h),
          itemBuilder: (_, i) => _ProductCard(product: list[i]),
        );
      }),
    );
  }
}

// ── Product card ──────────────────────────────────────────────────────────────
class _ProductCard extends StatelessWidget {
  final StockProduct product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final cfg = _categoryConfig(product.categoryEnum);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: AppShadows.sm,
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: cfg['bg'] as Color,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(cfg['icon'] as IconData,
                size: 22.sp, color: cfg['color'] as Color),
          ),
          SizedBox(width: 12.w),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(product.name,
                          style: AppTextStyle.bodyLargeMedium()),
                    ),
                    if (product.isLowStock)
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          color: AppColors.errorLight,
                          borderRadius: BorderRadius.circular(999.r),
                        ),
                        child: Text('Low Stock',
                            style: AppTextStyle.labelSmall(
                                color: AppColors.errorDark)),
                      ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(product.category,
                    style: AppTextStyle.bodySmall(
                        color: AppColors.textSecondary)),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Text(
                      'Qty: ${product.quantity}',
                      style: AppTextStyle.labelSmall(
                        color: product.isLowStock
                            ? AppColors.error
                            : AppColors.textSecondary,
                      ),
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
                      '₹${product.price.toStringAsFixed(0)}',
                      style: AppTextStyle.labelSmall(
                          color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _categoryConfig(StockCategory cat) {
    switch (cat) {
      case StockCategory.stationery:
        return {
          'icon': Icons.edit_outlined,
          'color': AppColors.success,
          'bg': AppColors.greenIconBg,
        };
      case StockCategory.officeSupplies:
        return {
          'icon': Icons.business_center_outlined,
          'color': AppColors.info,
          'bg': AppColors.blueIconBg,
        };
      case StockCategory.electronics:
        return {
          'icon': Icons.devices_outlined,
          'color': AppColors.accent,
          'bg': AppColors.purpleIconBg,
        };
      default:
        return {
          'icon': Icons.inventory_2_outlined,
          'color': AppColors.textSecondary,
          'bg': AppColors.grayIconBg,
        };
    }
  }
}

// ── Add Product bottom sheet ───────────────────────────────────────────────────
class _AddProductSheet extends StatefulWidget {
  const _AddProductSheet();

  @override
  State<_AddProductSheet> createState() => _AddProductSheetState();
}

class _AddProductSheetState extends State<_AddProductSheet> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _category = 'Stationery';
  String _qty = '';
  String _price = '';

  final categories = ['Stationery', 'Office Supplies', 'Electronics'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.all(20.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              Text('Add Product', style: AppTextStyle.h3()),
              SizedBox(height: 16.h),
              _SheetField(
                label: 'Product Name',
                hint: 'Enter product name',
                required: true,
                onSaved: (v) => _name = v ?? '',
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Required' : null,
              ),
              SizedBox(height: 12.h),
              Text('Category',
                  style: AppTextStyle.labelMedium(
                      color: AppColors.textPrimary)),
              SizedBox(height: 6.h),
              DropdownButtonFormField<String>(
                value: _category,
                style: AppTextStyle.bodyMedium(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.inputBackground,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                        color: AppColors.inputBorder, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                        color: AppColors.inputBorder, width: 1),
                  ),
                ),
                items: categories
                    .map((c) => DropdownMenuItem(
                          value: c,
                          child: Text(c, style: AppTextStyle.bodyMedium()),
                        ))
                    .toList(),
                onChanged: (v) => setState(() => _category = v!),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: _SheetField(
                      label: 'Quantity',
                      hint: '0',
                      required: true,
                      keyboardType: TextInputType.number,
                      onSaved: (v) => _qty = v ?? '0',
                      validator: (v) =>
                          (v == null || v.isEmpty) ? 'Required' : null,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _SheetField(
                      label: 'Price (₹)',
                      hint: '0',
                      required: true,
                      keyboardType: TextInputType.number,
                      onSaved: (v) => _price = v ?? '0',
                      validator: (v) =>
                          (v == null || v.isEmpty) ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pop(context);
                      Get.snackbar(
                        'Product added',
                        '$_name added to stock.',
                        backgroundColor: AppColors.success,
                        colorText: AppColors.white,
                        snackPosition: SnackPosition.TOP,
                        margin: EdgeInsets.all(16.w),
                        borderRadius: 12.r,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r)),
                  ),
                  child: Text('Add Product',
                      style: AppTextStyle.buttonLarge(
                          color: AppColors.white)),
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _SheetField extends StatelessWidget {
  final String label;
  final String hint;
  final bool required;
  final TextInputType? keyboardType;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;

  const _SheetField({
    required this.label,
    required this.hint,
    this.required = false,
    this.keyboardType,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: AppTextStyle.labelMedium(color: AppColors.textPrimary),
            children: required
                ? [
                    TextSpan(
                        text: ' *',
                        style: AppTextStyle.labelMedium(
                            color: AppColors.error))
                  ]
                : [],
          ),
        ),
        SizedBox(height: 6.h),
        TextFormField(
          keyboardType: keyboardType,
          style: AppTextStyle.bodyMedium(),
          onSaved: onSaved,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyle.inputHint(),
            filled: true,
            fillColor: AppColors.inputBackground,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:
                  const BorderSide(color: AppColors.inputBorder, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:
                  const BorderSide(color: AppColors.inputBorder, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:
                  const BorderSide(color: AppColors.focusRing, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}