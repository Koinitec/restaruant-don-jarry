import 'package:flutter/material.dart';
import 'bottom_navigation_bar_item_data.dart';

class NavigationBarItem extends StatelessWidget {
  final BottomNavigationBarItemData item;
  final bool selected;
  final VoidCallback onTap;

  const NavigationBarItem({
    super.key,
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = selected
        ? colorScheme.primary
        : colorScheme.onSurface.withValues(alpha: 0.6);

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        decoration: BoxDecoration(
          color: selected
              ? colorScheme.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: selected ? 1.2 : 1.0,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              child: Icon(item.icon, color: iconColor, size: 24),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: iconColor,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                fontSize: selected ? 13.5 : 12.5,
              ),
              child: Text(item.label),
            ),
          ],
        ),
      ),
    );
  }
}
