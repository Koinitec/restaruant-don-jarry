import 'package:flutter/material.dart';
import 'package:restaruant_don_jarry/pages/home_page.dart';
import 'package:restaruant_don_jarry/pages/menu_page.dart';
import 'package:restaruant_don_jarry/shared/navigation/bottom_navigation_bar.dart';

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
      Scaffold(body: HomePage()),
      Scaffold(body: MenuPage()),
      Scaffold(body: Center(child: Text('Inventario'))),
      Scaffold(body: Center(child: Text('Pedidos'))),
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
      bottomNavigationBar: BottomNavigationBarShared(
        currentIndex: _currentIndex,
        onChanged: _onNavChanged,
      ),
    );
  }
}
