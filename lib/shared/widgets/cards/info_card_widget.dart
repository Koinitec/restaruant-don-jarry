import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

/// Widget reutilizable para mostrar información resumida en forma de tarjeta.
///
/// Totalmente responsivo para móviles y tablets.
///
/// Ejemplo:
/// ```dart
/// InfoCardWidget(
///   icon: FIcons.dollarSign,
///   title: 'Ventas del Día',
///   subtitle: '\$4,120',
///   detail: '↑ +15% respecto a ayer',
///   color: Colors.green,
/// )
/// ```
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final double scale = (constraints.maxWidth / 400).clamp(0.75, 1.3);
        final bool isVertical = constraints.maxWidth < 300;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FCard(
            child: Padding(
              padding: EdgeInsets.all(16 * scale),
              child: Flex(
                direction: isVertical ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: isVertical
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(14 * scale),
                    ),
                    padding: EdgeInsets.all(10 * scale),
                    margin: EdgeInsets.only(
                      bottom: isVertical ? 12 * scale : 0,
                    ),
                    child: Icon(icon, color: color, size: 36 * scale),
                  ),

                  SizedBox(width: isVertical ? 0 : 20 * scale),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: isVertical
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 15 * scale,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: isVertical
                              ? TextAlign.center
                              : TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6 * scale),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 28 * scale,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                          textAlign: isVertical
                              ? TextAlign.center
                              : TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6 * scale),
                        Text(
                          detail,
                          style: TextStyle(
                            fontSize: 13 * scale,
                            color: Colors.grey.shade600,
                          ),
                          textAlign: isVertical
                              ? TextAlign.center
                              : TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
