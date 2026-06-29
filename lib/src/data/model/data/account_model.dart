import '../../../core/enum/enum.dart';

class AccountModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String address;
  final AccountType type;
  final double creditLimit;
  final double openingBalance;
  final double balance;
  final AccountStatus status;

  const AccountModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.type,
    required this.creditLimit,
    required this.openingBalance,
    required this.balance,
    required this.status,
  });

  bool get isCustomer => type == AccountType.customer;
  bool get isVendor => type == AccountType.vendor;
}



class AccountDummyData {
  static const List<AccountModel> accounts = [
    AccountModel(
      id: 'acc_001',
      name: 'Rajesh Kumar',
      phone: '+91 98765 43210',
      email: 'rajesh.kumar@gmail.com',
      address: '12, MG Road, Bengaluru, Karnataka 560001',
      type: AccountType.customer,
      creditLimit: 50000,
      openingBalance: 0,
      balance: 2340,
      status: AccountStatus.active,
    ),
    AccountModel(
      id: 'acc_002',
      name: 'Amit Patel',
      phone: '+91 98765 43212',
      email: 'amit.patel@outlook.com',
      address: '45, CG Road, Ahmedabad, Gujarat 380009',
      type: AccountType.customer,
      creditLimit: 30000,
      openingBalance: 1000,
      balance: 5600,
      status: AccountStatus.active,
    ),
    AccountModel(
      id: 'acc_003',
      name: 'Sneha Reddy',
      phone: '+91 98765 43214',
      email: 'sneha.reddy@yahoo.com',
      address: '8, Banjara Hills, Hyderabad, Telangana 500034',
      type: AccountType.customer,
      creditLimit: 20000,
      openingBalance: 500,
      balance: 1200,
      status: AccountStatus.active,
    ),
    AccountModel(
      id: 'acc_004',
      name: 'Priya Sharma',
      phone: '+91 98765 43216',
      email: 'priya.sharma@gmail.com',
      address: '22, Connaught Place, New Delhi 110001',
      type: AccountType.customer,
      creditLimit: 40000,
      openingBalance: 0,
      balance: 0,
      status: AccountStatus.settled,
    ),
    AccountModel(
      id: 'acc_005',
      name: 'Vikram Singh',
      phone: '+91 98765 43218',
      email: 'vikram.singh@gmail.com',
      address: '3, Marine Drive, Mumbai, Maharashtra 400020',
      type: AccountType.customer,
      creditLimit: 60000,
      openingBalance: 2000,
      balance: 8750,
      status: AccountStatus.active,
    ),
    AccountModel(
      id: 'acc_006',
      name: 'ABC Suppliers',
      phone: '+91 98765 43213',
      email: 'info@abcsuppliers.com',
      address: '78, Industrial Area, Pune, Maharashtra 411057',
      type: AccountType.vendor,
      creditLimit: 0,
      openingBalance: 5000,
      balance: 15000,
      status: AccountStatus.active,
    ),
    AccountModel(
      id: 'acc_007',
      name: 'XYZ Distributors',
      phone: '+91 98765 43215',
      email: 'sales@xyzdist.com',
      address: '56, Anna Salai, Chennai, Tamil Nadu 600002',
      type: AccountType.vendor,
      creditLimit: 0,
      openingBalance: 0,
      balance: 9500,
      status: AccountStatus.active,
    ),
    AccountModel(
      id: 'acc_008',
      name: 'Global Traders',
      phone: '+91 98765 43217',
      email: 'contact@globaltraders.in',
      address: '101, Salt Lake, Kolkata, West Bengal 700091',
      type: AccountType.vendor,
      creditLimit: 0,
      openingBalance: 3000,
      balance: 0,
      status: AccountStatus.settled,
    ),
    AccountModel(
      id: 'acc_009',
      name: 'Anjali Verma',
      phone: '+91 98765 43219',
      email: 'anjali.v@gmail.com',
      address: '67, Civil Lines, Jaipur, Rajasthan 302006',
      type: AccountType.customer,
      creditLimit: 25000,
      openingBalance: 0,
      balance: 3200,
      status: AccountStatus.active,
    ),
    AccountModel(
      id: 'acc_010',
      name: 'Metro Wholesale',
      phone: '+91 98765 43220',
      email: 'metro@wholesale.in',
      address: '34, MIDC, Nagpur, Maharashtra 440018',
      type: AccountType.vendor,
      creditLimit: 0,
      openingBalance: 1500,
      balance: 22000,
      status: AccountStatus.active,
    ),
  ];
}