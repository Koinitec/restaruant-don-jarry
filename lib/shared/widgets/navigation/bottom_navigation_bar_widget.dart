import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const items = [
      (icon: FIcons.house, label: 'Inicio'),
      (icon: FIcons.handbag, label: 'Pedidos'),
      (icon: FIcons.hamburger, label: 'Menú'),
      (icon: FIcons.box, label: 'Inventario'),
      (icon: FIcons.dollarSign, label: 'Ventas'),
    ];

    return FBottomNavigationBar(
      index: currentIndex,
      onChange: onChanged,
      children: items
          .map(
            (item) => FBottomNavigationBarItem(
              icon: Icon(item.icon),
              label: Text(item.label),
            ),
          )
          .toList(),
    );
  }
}
