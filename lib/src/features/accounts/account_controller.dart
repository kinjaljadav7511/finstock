import 'package:get/state_manager.dart';
import '../../data/model/data/account_model.dart';


class AccountController extends GetxController {
  // Tab: 0=All, 1=Customers, 2=Vendors
  final RxInt selectedTab = 0.obs;
  final RxString searchQuery = ''.obs;

  // Add Account form fields
  final RxString selectedType = 'Customer'.obs;
  final RxString name = ''.obs;
  final RxString phone = ''.obs;
  final RxString email = ''.obs;
  final RxString address = ''.obs;
  final RxDouble creditLimit = 0.0.obs;
  final RxDouble openingBalance = 0.0.obs;

  // All accounts list (starts with dummy data)
  final RxList<AccountModel> accounts =
      RxList<AccountModel>(List.from(AccountDummyData.accounts));

  List<AccountModel> get filteredAccounts {
    List<AccountModel> list = accounts;

    // Filter by tab
    if (selectedTab.value == 1) {
      list = list.where((a) => a.isCustomer).toList();
    } else if (selectedTab.value == 2) {
      list = list.where((a) => a.isVendor).toList();
    }

    // Filter by search
    final query = searchQuery.value.toLowerCase().trim();
    if (query.isNotEmpty) {
      list = list
          .where((a) =>
              a.name.toLowerCase().contains(query) ||
              a.phone.contains(query) ||
              a.email.toLowerCase().contains(query))
          .toList();
    }

    return list;
  }

  int get totalCustomers =>
      accounts.where((a) => a.isCustomer).length;
  int get totalVendors =>
      accounts.where((a) => a.isVendor).length;

  double get totalReceivable => accounts
      .where((a) => a.isCustomer && a.balance > 0)
      .fold(0, (sum, a) => sum + a.balance);

  double get totalPayable => accounts
      .where((a) => a.isVendor && a.balance > 0)
      .fold(0, (sum, a) => sum + a.balance);

  void selectTab(int index) => selectedTab.value = index;

  void updateSearch(String query) => searchQuery.value = query;

  void resetAddForm() {
    selectedType.value = 'Customer';
    name.value = '';
    phone.value = '';
    email.value = '';
    address.value = '';
    creditLimit.value = 0.0;
    openingBalance.value = 0.0;
  }

  void saveAccount() {
    final newAccount = AccountModel(
      id: 'acc_${DateTime.now().millisecondsSinceEpoch}',
      name: name.value,
      phone: phone.value,
      email: email.value,
      address: address.value,
      type: selectedType.value == 'Customer'
          ? AccountType.customer
          : AccountType.vendor,
      creditLimit: creditLimit.value,
      openingBalance: openingBalance.value,
      balance: openingBalance.value,
      status: AccountStatus.active,
    );
    accounts.add(newAccount);
    resetAddForm();
  }
}