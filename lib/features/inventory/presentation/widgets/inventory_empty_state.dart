import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class InventoryEmptyState extends StatelessWidget {
  const InventoryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FIcons.packageSearch, size: 80, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            const Text(
              'No hay productos aún',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Agrega tu primer producto para comenzar a gestionar el inventario.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
