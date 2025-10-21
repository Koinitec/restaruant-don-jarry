import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:restaruant_don_jarry/features/home/presentation/screens/home_screens.dart';
import 'package:restaruant_don_jarry/features/inventory/presentation/screens/inventory_screens.dart';
import 'package:restaruant_don_jarry/features/sales/presetantion/screens/sales_screens.dart';
import 'package:restaruant_don_jarry/features/users/presentation/screens/users_screens.dart';
import 'package:restaruant_don_jarry/shared/widgets/navigation/bottom_navigation_bar/bottom_navigation_bar_item_data.dart';
import 'package:restaruant_don_jarry/shared/widgets/navigation/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'package:restaruant_don_jarry/shared/widgets/navigation/sidebar/sidebar_widget.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  late final PageController pageController;

  final List<String> routes = ['/home', '/inventory', '/sales', '/users'];

  final List<Widget> pages = const [
    HomeScreens(),
    InventoryScreens(),
    SalesScreens(),
    UsersScreens(),
  ];

  final List<BottomNavigationBarItemData> navItems = const [
    BottomNavigationBarItemData(icon: FIcons.house, label: 'Inicio'),
    BottomNavigationBarItemData(icon: FIcons.archive, label: 'Inventario'),
    BottomNavigationBarItemData(icon: FIcons.shoppingCart, label: 'Ventas'),
    BottomNavigationBarItemData(icon: FIcons.users, label: 'Usuarios'),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex, keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onNavTap(int index) {
    if (index == currentIndex) return;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _updateRoute(index);
  }

  void onPageChanged(int index) {
    if (index == currentIndex) return;
    _updateRoute(index);
  }

  void _updateRoute(int index) {
    setState(() => currentIndex = index);
    GoRouter.of(context).go(routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isTabletOrDesktop = constraints.maxWidth >= 700;

        return Scaffold(
          body: Row(
            children: [
              if (isTabletOrDesktop) _buildSidebar(),
              Expanded(child: _buildContent(isTabletOrDesktop)),
            ],
          ),
          bottomNavigationBar: _buildBottomNav().visible(!isTabletOrDesktop),
        );
      },
    );
  }

  Widget _buildSidebar() {
    return SidebarWidget(
      title: 'Don Jarry',
      subtitle: 'Administrador',
      groups: [
        FSidebarGroup(
          children: List.generate(navItems.length, (i) {
            final item = navItems[i];
            return FSidebarItem(
              icon: Icon(item.icon),
              label: Text(item.label),
              selected: currentIndex == i,
              onPress: () => onNavTap(i),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildContent(bool isTabletOrDesktop) {
    return PageView(
      controller: pageController,
      physics: isTabletOrDesktop
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      onPageChanged: onPageChanged,
      children: pages,
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBarWidget(
      currentIndex: currentIndex,
      items: navItems,
      onTap: onNavTap,
    );
  }
}

extension VisibilityExtension on Widget {
  Widget visible(bool isVisible) => Visibility(visible: isVisible, child: this);
}
