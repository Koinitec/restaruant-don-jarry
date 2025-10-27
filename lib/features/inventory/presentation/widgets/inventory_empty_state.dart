import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class InventoryEmptyState extends StatefulWidget {
  const InventoryEmptyState({super.key});

  @override
  State<InventoryEmptyState> createState() => _InventoryEmptyStateState();
}

class _InventoryEmptyStateState extends State<InventoryEmptyState> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = Colors.grey.shade600;
    final iconColor = Colors.grey.shade400;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                FIcons.packageSearch,
                size: MediaQuery.of(context).size.width < 400 ? 64 : 96,
                color: iconColor,
              ),
              const SizedBox(height: 20),
              Text(
                'No hay productos aún',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Agrega tu primer producto para comenzar a gestionar el inventario.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: textColor,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
