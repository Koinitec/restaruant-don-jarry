import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/widgets/cards/info_card_widget.dart';

class InventorySummaryCards extends StatelessWidget {
  // Constantes visuales
  static const double _maxContainerWidth = 1200.0;
  static const double _cardPadding = 16.0;
  static const double _cardSpacing = 16.0;
  static const double _maxCardWidth = 360.0;
  static const double _childAspectRatio = 2.3;

  // Colores tipo
  static const Color _primaryColor = Color(0xFFd35400);
  static const Color _warningColor = Color(0xFFf39c12);
  static const Color _dangerColor = Colors.redAccent;

  /// Lista de productos del inventario
  final List<Map<String, dynamic>> products;

  const InventorySummaryCards({super.key, required this.products});

  /// Cálculos de negocio
  int get _stockLowCount =>
      products.where((p) => (p['stock'] ?? 0) < 20).length;

  int get _outOfStockCount =>
      products.where((p) => (p['stock'] ?? 0) == 0).length;

  /// Tarjetas a mostrar
  List<_CardData> get _cards => [
    _CardData(
      icon: FIcons.package,
      title: 'Total de Productos',
      subtitle: '${products.length}',
      detail: 'Todos los productos',
      color: _primaryColor,
    ),
    _CardData(
      icon: FIcons.circleAlert,
      title: 'Stock Bajo',
      subtitle: '$_stockLowCount',
      detail: 'Inventario limitado',
      color: _warningColor,
    ),
    _CardData(
      icon: FIcons.triangleAlert,
      title: 'Agotados',
      subtitle: '$_outOfStockCount',
      detail: 'Sin stock',
      color: _dangerColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _maxContainerWidth),
        child: Padding(
          padding: const EdgeInsets.all(_cardPadding),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: _maxCardWidth,
              crossAxisSpacing: _cardSpacing,
              mainAxisSpacing: _cardSpacing,
              childAspectRatio: _childAspectRatio,
            ),
            itemCount: _cards.length,
            itemBuilder: (context, index) {
              final card = _cards[index];
              return InfoCardWidget(
                icon: card.icon,
                title: card.title,
                subtitle: card.subtitle,
                detail: card.detail,
                color: card.color,
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Modelo de datos para las tarjetas
class _CardData {
  final IconData icon;
  final String title;
  final String subtitle;
  final String detail;
  final Color color;

  const _CardData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.detail,
    required this.color,
  });
}
