import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

/// Widget reutilizable para mostrar información resumida en una tarjeta.
///
/// Ideal para dashboards o paneles con estadísticas.
///
/// ### Ejemplo de uso:
/// ```dart
/// InfoCardWidget(
///   icon: FIcons.dollarSign,
///   title: 'Ventas del Día',
///   subtitle: '\$4,120',
///   detail: '↑ +15% respecto a ayer',
///   color: Colors.green,
/// )
/// ```
///
/// ### Parámetros:
/// - [icon]: Ícono principal de la tarjeta.
/// - [title]: Título de la tarjeta.
/// - [subtitle]: Texto destacado (por ejemplo, monto o cantidad).
/// - [detail]: Texto adicional (por ejemplo, descripción o tendencia).
/// - [color]: Color principal para el ícono y texto.
/// - [iconSize]: Tamaño del ícono (por defecto 28).
class InfoCardWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String detail;
  final Color color;

  const InfoCardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.detail,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final scale = (screenWidth / 400).clamp(0.8, 1.5);

    return FCard(
      child: Padding(
        padding: EdgeInsets.all(12 * scale),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28 * scale),
            SizedBox(height: 12 * scale),

            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16 * scale,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            SizedBox(height: 4 * scale),

            Flexible(
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 20 * scale,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 4 * scale),

            Flexible(
              child: Text(
                detail,
                style: TextStyle(
                  fontSize: 13 * scale,
                  color: Colors.grey.shade600,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
