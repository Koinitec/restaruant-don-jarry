import 'package:flutter/material.dart';
import 'package:restaruant_don_jarry/features/home/presentation/screens/home_screens.dart';
import 'package:restaruant_don_jarry/features/inventory/presentation/screens/inventory_screens.dart';
import 'package:restaruant_don_jarry/pages/menu_page.dart';
import 'package:restaruant_don_jarry/shared/widgets/navigation/bottom_navigation_bar_widget.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  void _onNavChanged(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      Scaffold(body: HomeScreens()),
      Scaffold(body: MenuPage()),
      Scaffold(body: Center(child: Text('Pedidos'))),
      Scaffold(body: InventoryScreens()),
      Scaffold(body: Center(child: Text('Reportes'))),
      Scaffold(body: Center(child: Text('Ventas'))),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: _onPageChanged,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _currentIndex,
        onChanged: _onNavChanged,
      ),
    );
  }
}
