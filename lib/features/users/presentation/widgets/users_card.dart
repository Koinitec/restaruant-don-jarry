import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class UsersCard extends StatefulWidget {
  final Map<String, dynamic> user;
  final int index;
  final double iconSize;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const UsersCard({
    super.key,
    required this.user,
    required this.index,
    required this.iconSize,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<UsersCard> createState() => _UsersCardState();
}

class _UsersCardState extends State<UsersCard> {
  @override
  Widget build(BuildContext context) {
    // Valores seguros con fallback
    final String name = widget.user['name'] ?? 'Sin nombre';
    final String role = widget.user['role'] ?? 'Empleado';
    final String emoji = widget.user['emoji'] ?? '👤';

    // Color según rol
    Color roleColor;
    switch (role) {
      case 'Admin':
        roleColor = Colors.blueAccent;
        break;
      case 'Vendedor':
        roleColor = Colors.orangeAccent;
        break;
      case 'Empleado':
      default:
        roleColor = Colors.green;
        break;
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
                    "Rol: $role",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: roleColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            // Menú de acciones
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
