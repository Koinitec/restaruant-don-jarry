import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class InventoryProductCard extends StatefulWidget {
  final Map<String, dynamic> product;
  final int index;
  final double iconSize;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const InventoryProductCard({
    super.key,
    required this.product,
    required this.index,
    required this.iconSize,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<InventoryProductCard> createState() => _InventoryProductCardState();
}

class _InventoryProductCardState extends State<InventoryProductCard> {
  @override
  Widget build(BuildContext context) {
    // 🧩 Valores seguros con fallback
    final int stock = widget.product['stock'] is int ? widget.product['stock'] : 0;
    final String name = widget.product['name'] ?? 'Sin nombre';
    final String category = widget.product['category'] ?? 'Sin categoría';
    final String emoji = widget.product['emoji'] ?? '📦';

    Color color;
    if (stock == 0) {
      color = Colors.redAccent;
    } else if (stock < 20) {
      color = const Color(0xFFf39c12);
    } else {
      color = const Color(0xFFd35400);
    }

    return FCard(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(emoji, style: TextStyle(fontSize: widget.iconSize + 6)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Stock: $stock",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Categoría: $category",
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            // ✅ Cambiamos el menú por íconos nativos (para evitar error de tipo)
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') widget.onEdit();
                if (value == 'delete') widget.onDelete();
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit, size: 18),
                      SizedBox(width: 8),
                      Text('Editar'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, size: 18, color: Colors.redAccent),
                      SizedBox(width: 8),
                      Text('Eliminar'),
                    ],
                  ),
                ),
              ],
              icon: const Icon(Icons.more_vert, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
