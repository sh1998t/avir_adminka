import 'package:avir_app/core/theme/colors.dart';
import 'package:avir_app/presentation/screens/balance_screen/balance_screen.dart';
import 'package:avir_app/presentation/screens/closing_the_day_screen/closing_the_day_screen.dart';
import 'package:avir_app/presentation/screens/deposit_screen/deposit_screen.dart';
import 'package:avir_app/presentation/screens/home_screen/home_screen.dart';
import 'package:avir_app/presentation/screens/operation_register_screen/operation_register_screen.dart';
import 'package:avir_app/presentation/screens/operations_screen/operations_screen.dart';
import 'package:avir_app/presentation/screens/partners_screen/partners_screen.dart';
import 'package:avir_app/presentation/screens/payments_screen/payments_screen.dart';
import 'package:avir_app/presentation/screens/regions_screen/regions_screen.dart';
import 'package:avir_app/presentation/screens/settings_screen/settings_screen.dart';
import 'package:avir_app/presentation/screens/sms_history_screen/sms_history_screen.dart';
import 'package:avir_app/presentation/screens/structures_screen/structures_screen.dart';
import 'package:avir_app/presentation/screens/suspicious_screen/suspicious_screen.dart';
import 'package:avir_app/presentation/screens/transactions_screen/transactions_screen.dart';
import 'package:avir_app/presentation/screens/users_screen/users_screen.dart';
import 'package:avir_app/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../categories_screen/categories_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final PageController controller = PageController();
  bool _isDrawerOpen = false;

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  void _navigateToPage(int pageIndex) {
    controller.jumpToPage(pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9EC2BCFF),
      body: Stack(
        children: [
          // Drawer
          Positioned(
            left: _isDrawerOpen ? 0 : -200,
            top: 0,
            bottom: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 250,
              color: AppColors.drawerColors,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      "Admin",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ButtonWidget(
                    icon: Icons.dashboard,
                    title: "Дашборды",
                    onPressed: () => _navigateToPage(0),
                  ),
                  ButtonWidget(
                    icon: Icons.person,
                    title: "Пользователи",
                    onPressed: () => _navigateToPage(1),
                  ),
                  ButtonWidget(
                    icon: Icons.paid_outlined,
                    title: "Транзакции",
                    onPressed: () => _navigateToPage(2),
                  ),
                  ButtonWidget(
                    icon: Icons.cloud_download,
                    title: "Реестр операции",
                    onPressed: () => _navigateToPage(3),
                  ),
                  ButtonWidget(
                    icon: Icons.category,
                    title: "Категории",
                    onPressed: () => _navigateToPage(4),
                  ),
                  ButtonWidget(
                    icon: Icons.payment,
                    title: "Платежи",
                    onPressed: () => _navigateToPage(5),
                  ),
                  ButtonWidget(
                    icon: Icons.handshake,
                    title: "Партнеры",
                    onPressed: () => _navigateToPage(6),
                  ),
                  ButtonWidget(
                    icon: Icons.settings,
                    title: "Настройки",
                    onPressed: () => _navigateToPage(7),
                  ),
                  ButtonWidget(
                    icon: Icons.message,
                    title: "История СМСов",
                    onPressed: () => _navigateToPage(8),
                  ),
                  ButtonWidget(
                    icon: Icons.map,
                    title: "Регионы",
                    onPressed: () => _navigateToPage(9),
                  ),
                  ButtonWidget(
                    icon: Icons.apartment,
                    title: "Структуры",
                    onPressed: () => _navigateToPage(10),
                  ),
                  ButtonWidget(
                    icon: Icons.close,
                    title: "Закрытие дня",
                    onPressed: () => _navigateToPage(11),
                  ),
                  ButtonWidget(
                    icon: Icons.warning,
                    title: "Подозрительное",
                    onPressed: () => _navigateToPage(12),
                  ),
                  ButtonWidget(
                    icon: Icons.settings_applications,
                    title: "Операции",
                    onPressed: () => _navigateToPage(13),
                  ),
                  ButtonWidget(
                    icon: Icons.account_balance_wallet,
                    title: "Депозит",
                    onPressed: () => _navigateToPage(14),
                  ),
                  ButtonWidget(
                    icon: Icons.account_balance,
                    title: "Баланс",
                    onPressed: () => _navigateToPage(15),
                  ),
                ],
              ),
            ),
          ),
          // Main content and AppBar
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.translationValues(_isDrawerOpen ? 200 : 0, 0, 0),
            child: Scaffold(
              backgroundColor: Colors.teal,
              appBar: AppBar(
                title: const Text('Admin Panel'),
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: _toggleDrawer,
                ),
              ),
              body: PageView(
                controller: controller,
                children: [
                  HomeScreen(),
                  UsersScreen(
                    width: _isDrawerOpen
                        ? MediaQuery.of(context).size.width - 260
                        : MediaQuery.of(context).size.width,
                  ),
                  TransactionsScreen(),
                  OperationRegisterScreen(),
                  CategoriesScreen(),
                  PaymentsScreen(),
                  PartnersScreen(),
                  SettingsScreen(),
                  SmsHistoryScreen(),
                  RegionsScreen(),
                  StructuresScreen(),
                  ClosingTheDayScreen(),
                  SuspiciousScreen(),
                  OperationsScreen(),
                  DepositScreen(),
                  BalanceScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Importing all the screens
