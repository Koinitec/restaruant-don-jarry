import 'package:flutter/material.dart';
import 'bottom_navigation_bar_item_data.dart';
import '_navigation_bar_item.dart';

/// BottomNavigationBarWidget: barra de navegación inferior reusable y responsive.
///
/// Este widget permite crear una barra de navegación inferior con animaciones,
/// diseño adaptativo (móvil y tablet) y elementos personalizables.
///
/// Propiedades:
/// - [currentIndex]: índice del item actualmente seleccionado.
/// - [items]: lista de [BottomNavigationBarItemData] que define icono, label y ruta.
///
/// La barra maneja automáticamente:
/// - Animación al cambiar de item
/// - Resaltado del item seleccionado
/// - Ajuste de padding según tamaño de pantalla
///
/// Ejemplo de uso:
/// ```dart
/// BottomNavigationBarWidget(
///   currentIndex: 0,
///   items: const [
///     BottomNavigationBarItemData(
///       icon: Icons.home,
///       label: 'Inicio',
///       route: '/home',
///     ),
///     BottomNavigationBarItemData(
///       icon: Icons.inventory,
///       label: 'Inventario',
///       route: '/inventory',
///     ),
///   ],
/// )
/// ```
class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final List<BottomNavigationBarItemData> items;
  final ValueChanged<int> onTap;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isTablet = MediaQuery.of(context).size.width > 600;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.symmetric(
        vertical: isTablet ? 12 : 8,
        horizontal: isTablet ? 40 : 16,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            items.length,
            (index) => NavigationBarItem(
              item: items[index],
              selected: index == currentIndex,
              onTap: () => onTap(index),
            ),
          ),
        ),
      ),
    );
  }
}
