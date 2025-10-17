import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/widgets/cards/info_card_widget.dart';

class InventorySummaryCards extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const InventorySummaryCards({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFFd35400);
    final warning = const Color(0xFFf39c12);
    final danger = Colors.redAccent;

    final stockLow = products.where((p) => (p['stock'] ?? 0) < 20).length;
    final outOfStock = products.where((p) => (p['stock'] ?? 0) == 0).length;

    final cards = [
      (
        FIcons.package,
        'Total de Productos',
        '${products.length}',
        'Todos los productos',
        primary,
      ),
      (
        FIcons.circleAlert,
        'Stock Bajo',
        '$stockLow',
        'Inventario limitado',
        warning,
      ),
      (FIcons.triangleAlert, 'Agotados', '$outOfStock', 'Sin stock', danger),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calcula cuántas tarjetas caben según el ancho de pantalla
        double maxWidth = constraints.maxWidth;
        int crossAxisCount = (maxWidth / 300).floor().clamp(1, 4);

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 2.3,
              ),
              itemCount: cards.length,
              itemBuilder: (_, i) {
                final (icon, title, subtitle, detail, color) = cards[i];
                return InfoCardWidget(
                  icon: icon,
                  title: title,
                  subtitle: subtitle,
                  detail: detail,
                  color: color,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
