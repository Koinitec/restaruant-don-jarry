import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:restaruant_don_jarry/shared/widgets/navigation/bottom_navigation_bar/bottom_navigation_bar_item_data.dart';
import 'package:restaruant_don_jarry/shared/widgets/navigation/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'package:restaruant_don_jarry/shared/widgets/navigation/sidebar/sidebar_widget.dart';
import 'package:restaruant_don_jarry/features/home/presentation/screens/home_screens.dart';
import 'package:restaruant_don_jarry/features/inventory/presentation/screens/inventory_screens.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  late final PageController pageController;

  final List<String> routes = ['/home', '/inventory'];
  final List<Widget> pages = const [HomeScreens(), InventoryScreens()];

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

  /// Toca la barra de navegación
  void onNavTap(int index) {
    if (index == currentIndex) return;

    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    // También actualiza la ruta
    GoRouter.of(context).go(routes[index]);

    setState(() => currentIndex = index);
  }

  void onPageChanged(int index) {
    if (index == currentIndex) return;
    setState(() => currentIndex = index);

    // Actualiza la ruta
    GoRouter.of(context).go(routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTabletOrDesktop = constraints.maxWidth >= 700;

        // Sidebar para tablet/escritorio
        final sidebar = SidebarWidget(
          title: 'Don Jarry',
          subtitle: 'Administrador',
          groups: [
            FSidebarGroup(
              children: [
                FSidebarItem(
                  icon: const Icon(FIcons.house),
                  label: const Text('Inicio'),
                  selected: currentIndex == 0,
                  onPress: () => onNavTap(0),
                ),
                FSidebarItem(
                  icon: const Icon(FIcons.archive),
                  label: const Text('Inventario'),
                  selected: currentIndex == 1,
                  onPress: () => onNavTap(1),
                ),
              ],
            ),
          ],
        );

        // Contenido principal con PageView
        final content = PageView(
          controller: pageController,
          physics: isTabletOrDesktop
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
          onPageChanged: onPageChanged,
          children: pages,
        );

        // Barra inferior para móvil
        final bottomNav = BottomNavigationBarWidget(
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItemData(icon: FIcons.house, label: 'Inicio'),
            BottomNavigationBarItemData(
              icon: FIcons.archive,
              label: 'Inventario',
            ),
          ],
          onTap: onNavTap,
        );

        return Scaffold(
          body: Row(
            children: [
              if (isTabletOrDesktop) sidebar,
              Expanded(child: content),
            ],
          ),
          bottomNavigationBar: bottomNav.visible(!isTabletOrDesktop),
        );
      },
    );
  }
}

/// Extensión para mostrar/ocultar widgets fácilmente
extension VisibilityExtension on Widget {
  Widget visible(bool isVisible) => Visibility(visible: isVisible, child: this);
}
