import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../data/model/data/account_model.dart';
import 'account_controller.dart';


// ─── Theme imports (adjust path to your project) ───────────────────────────
import 'package:finstock/src/theme/theme_export.dart';

// ===========================================================================
//  ACCOUNTS PAGE  (list view)
// ===========================================================================
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AccountController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _AccountsHeader(controller: controller),
            _SearchBar(controller: controller),
            _TabRow(controller: controller),
            const SizedBox(height: 4),
            _AccountList(controller: controller),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddAccountPage()),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}

// ── Header ──────────────────────────────────────────────────────────────────
class _AccountsHeader extends StatelessWidget {
  final AccountController controller;
  const _AccountsHeader({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
      child: Text('Accounts', style: AppTextStyle.h2()),
    );
  }
}

// ── Search bar ──────────────────────────────────────────────────────────────
class _SearchBar extends StatelessWidget {
  final AccountController controller;
  const _SearchBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: TextField(
        onChanged: controller.updateSearch,
        style: AppTextStyle.bodyMedium(),
        decoration: InputDecoration(
          hintText: 'Search accounts...',
          hintStyle: AppTextStyle.inputHint(),
          prefixIcon: Icon(
            Icons.search,
            size: 20.sp,
            color: AppColors.textTertiary,
          ),
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

// ── Tab row ─────────────────────────────────────────────────────────────────
class _TabRow extends StatelessWidget {
  final AccountController controller;
  const _TabRow({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Obx(() {
        return Row(
          children: [
            _TabChip(
              label: 'All',
              selected: controller.selectedTab.value == 0,
              onTap: () => controller.selectTab(0),
            ),
            SizedBox(width: 8.w),
            _TabChip(
              label: 'Customers',
              selected: controller.selectedTab.value == 1,
              onTap: () => controller.selectTab(1),
            ),
            SizedBox(width: 8.w),
            _TabChip(
              label: 'Vendors',
              selected: controller.selectedTab.value == 2,
              onTap: () => controller.selectTab(2),
            ),
          ],
        );
      }),
    );
  }
}

class _TabChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TabChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(999.r),
          boxShadow: selected ? AppShadows.sm : AppShadows.xs,
        ),
        child: Text(
          label,
          style: AppTextStyle.labelSmall(
            color: selected ? AppColors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

// ── Account list ─────────────────────────────────────────────────────────────
class _AccountList extends StatelessWidget {
  final AccountController controller;
  const _AccountList({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final list = controller.filteredAccounts;
        if (list.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.people_outline,
                    size: 48.sp, color: AppColors.textDisabled),
                SizedBox(height: 12.h),
                Text('No accounts found',
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
          itemBuilder: (context, index) =>
              _AccountCard(account: list[index]),
        );
      }),
    );
  }
}

// ── Single account card ──────────────────────────────────────────────────────
class _AccountCard extends StatelessWidget {
  final AccountModel account;
  const _AccountCard({required this.account});

  @override
  Widget build(BuildContext context) {
    final isSettled = account.status == AccountStatus.settled;
    final isCustomer = account.isCustomer;

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
          // Top row: name + type badge
          Row(
            children: [
              Expanded(
                child: Text(account.name, style: AppTextStyle.bodyLargeMedium()),
              ),
              _TypeBadge(isCustomer: isCustomer),
            ],
          ),
          SizedBox(height: 6.h),
          // Phone
          Row(
            children: [
              Icon(Icons.phone_outlined,
                  size: 14.sp, color: AppColors.textTertiary),
              SizedBox(width: 6.w),
              Text(account.phone,
                  style:
                      AppTextStyle.bodySmall(color: AppColors.textSecondary)),
            ],
          ),
          SizedBox(height: 10.h),
          const Divider(color: AppColors.divider, height: 1),
          SizedBox(height: 10.h),
          // Balance row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isCustomer ? 'To Receive' : 'To Pay',
                style:
                    AppTextStyle.bodySmall(color: AppColors.textSecondary),
              ),
              if (isSettled)
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: AppColors.successLight,
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Text(
                    'Settled',
                    style: AppTextStyle.labelSmall(
                        color: AppColors.successDark),
                  ),
                )
              else
                Text(
                  '₹${_formatAmount(account.balance)}',
                  style: AppTextStyle.bodyLargeMedium(
                    color: isCustomer
                        ? AppColors.success
                        : AppColors.error,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatAmount(double amount) {
    if (amount >= 100000) {
      return '${(amount / 100000).toStringAsFixed(1)}L';
    } else if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(1)}K';
    }
    return amount.toStringAsFixed(0);
  }
}

class _TypeBadge extends StatelessWidget {
  final bool isCustomer;
  const _TypeBadge({required this.isCustomer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: isCustomer ? AppColors.primaryLight : AppColors.accentLight,
        borderRadius: BorderRadius.circular(999.r),
      ),
      child: Text(
        isCustomer ? 'Customer' : 'Vendor',
        style: AppTextStyle.labelSmall(
          color: isCustomer ? AppColors.primary : AppColors.accent,
        ),
      ),
    );
  }
}

// ===========================================================================
//  ADD ACCOUNT PAGE
// ===========================================================================
class AddAccountPage extends StatefulWidget {
  const AddAccountPage({super.key});

  @override
  State<AddAccountPage> createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final AccountController controller = Get.find<AccountController>();

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _addressFocus = FocusNode();
  final _creditFocus = FocusNode();
  final _balanceFocus = FocusNode();

  @override
  void dispose() {
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _emailFocus.dispose();
    _addressFocus.dispose();
    _creditFocus.dispose();
    _balanceFocus.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      controller.saveAccount();
      Get.back();
      Get.snackbar(
        'Account saved',
        '${controller.selectedType.value} account created successfully.',
        backgroundColor: AppColors.success,
        colorText: AppColors.white,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(16.w),
        borderRadius: 12.r,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,
              size: 18.sp, color: AppColors.textPrimary),
          onPressed: () => Get.back(),
        ),
        title: Text('Add Account', style: AppTextStyle.h3()),
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Import from contacts button
              _ImportContactsButton(),
              SizedBox(height: 16.h),

              // Account type selector
              _SectionCard(
                children: [
                  _SectionLabel('Account Type'),
                  SizedBox(height: 10.h),
                  Obx(() => _AccountTypeToggle(controller: controller)),
                ],
              ),
              SizedBox(height: 16.h),

              // Basic info section
              _SectionCard(
                children: [
                  _SectionLabel('Basic Information'),
                  SizedBox(height: 14.h),
                  _FormField(
                    label: 'Name',
                    required: true,
                    hint: 'Enter name',
                    focusNode: _nameFocus,
                    nextFocus: _phoneFocus,
                    onSaved: (v) => controller.name.value = v ?? '',
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'Name is required' : null,
                  ),
                  SizedBox(height: 14.h),
                  _FormField(
                    label: 'Phone Number',
                    required: true,
                    hint: '+91 98765 43210',
                    focusNode: _phoneFocus,
                    nextFocus: _emailFocus,
                    keyboardType: TextInputType.phone,
                    onSaved: (v) => controller.phone.value = v ?? '',
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Phone is required'
                        : null,
                  ),
                  SizedBox(height: 14.h),
                  _FormField(
                    label: 'Email',
                    hint: 'email@example.com',
                    focusNode: _emailFocus,
                    nextFocus: _addressFocus,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (v) => controller.email.value = v ?? '',
                  ),
                  SizedBox(height: 14.h),
                  _FormField(
                    label: 'Address',
                    hint: 'Enter address',
                    focusNode: _addressFocus,
                    maxLines: 3,
                    onSaved: (v) => controller.address.value = v ?? '',
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // Financial info section
              _SectionCard(
                children: [
                  _SectionLabel('Financial Information'),
                  SizedBox(height: 14.h),
                  _FormField(
                    label: 'Credit Limit',
                    hint: '0',
                    focusNode: _creditFocus,
                    nextFocus: _balanceFocus,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onSaved: (v) =>
                        controller.creditLimit.value = double.tryParse(v ?? '0') ?? 0,
                  ),
                  SizedBox(height: 14.h),
                  Obx(() => _FormField(
                        label: 'Opening Balance',
                        hint: '0',
                        focusNode: _balanceFocus,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        helperText: controller.selectedType.value == 'Customer'
                            ? 'Amount customer owes you'
                            : 'Amount you owe vendor',
                        onSaved: (v) => controller.openingBalance.value =
                            double.tryParse(v ?? '0') ?? 0,
                      )),
                ],
              ),
              SizedBox(height: 24.h),

              // Save button
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  child: Text(
                    'Save Account',
                    style: AppTextStyle.buttonLarge(color: AppColors.white),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Import contacts button ───────────────────────────────────────────────────
class _ImportContactsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // hook up contacts plugin later
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.borderStrong,
            width: 1.5,
            style: BorderStyle.solid,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.upload_outlined,
                size: 18.sp, color: AppColors.textSecondary),
            SizedBox(width: 8.w),
            Text(
              'Import from Contacts',
              style: AppTextStyle.labelMedium(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Account type toggle ──────────────────────────────────────────────────────
class _AccountTypeToggle extends StatelessWidget {
  final AccountController controller;
  const _AccountTypeToggle({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: ['Customer', 'Vendor'].map((type) {
          final selected = controller.selectedType.value == type;
          return Expanded(
            child: GestureDetector(
              onTap: () => controller.selectedType.value = type,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.all(4.w),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: selected ? AppColors.surface : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                  border: selected
                      ? Border.all(color: AppColors.primary, width: 1.5)
                      : null,
                  boxShadow: selected ? AppShadows.xs : null,
                ),
                child: Center(
                  child: Text(
                    type,
                    style: AppTextStyle.labelMedium(
                      color: selected
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ── Section card wrapper ─────────────────────────────────────────────────────
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

// ── Section label ────────────────────────────────────────────────────────────
class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyle.labelLarge());
  }
}

// ── Reusable form field ──────────────────────────────────────────────────────
class _FormField extends StatelessWidget {
  final String label;
  final String hint;
  final bool required;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;

  const _FormField({
    required this.label,
    required this.hint,
    this.required = false,
    this.focusNode,
    this.nextFocus,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
    this.helperText,
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
                      style: AppTextStyle.labelMedium(color: AppColors.error),
                    )
                  ]
                : [],
          ),
        ),
        SizedBox(height: 6.h),
        TextFormField(
          focusNode: focusNode,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          textInputAction:
              nextFocus != null ? TextInputAction.next : TextInputAction.done,
          onFieldSubmitted: (_) {
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            }
          },
          style: AppTextStyle.bodyMedium(),
          onSaved: onSaved,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyle.inputHint(),
            helperText: helperText,
            helperStyle: AppTextStyle.caption(color: AppColors.textTertiary),
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:
                  const BorderSide(color: AppColors.error, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}