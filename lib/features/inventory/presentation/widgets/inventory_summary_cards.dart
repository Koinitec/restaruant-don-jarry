import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/widgets/cards/info_card_widget.dart';
import 'package:restaruant_don_jarry/shared/models/card_info.dart';

class InventorySummaryCards extends StatelessWidget {
  static const double _maxContainerWidth = 1400.0;
  static const double _horizontalPadding = 16.0;
  static const double _minCardWidth = 300.0;
  static const double _maxCardWidth = 420.0;
  static const double _cardSpacing = 24.0;

  static const Color _primaryColor = Color(0xFFd35400);
  static const Color _warningColor = Color(0xFFf39c12);
  static const Color _dangerColor = Colors.redAccent;

  final List<Map<String, dynamic>> products;

  const InventorySummaryCards({super.key, required this.products});

  int get _stockLowCount =>
      products.where((p) => (p['stock'] ?? 0) < 20).length;

  int get _outOfStockCount =>
      products.where((p) => (p['stock'] ?? 0) == 0).length;

  List<CardInfo> get _cards => [
    CardInfo(
      icon: FIcons.package,
      title: 'Total de Productos',
      subtitle: '${products.length}',
      detail: 'Todos los productos',
      color: _primaryColor,
    ),
    CardInfo(
      icon: FIcons.circleAlert,
      title: 'Stock Bajo',
      subtitle: '$_stockLowCount',
      detail: 'Inventario limitado',
      color: _warningColor,
    ),
    CardInfo(
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
          padding: const EdgeInsets.symmetric(
            horizontal: _horizontalPadding,
            vertical: 16,
          ),
          child: Wrap(
            spacing: _cardSpacing,
            runSpacing: _cardSpacing,
            alignment: WrapAlignment.center,
            children: _cards.map((card) {
              return ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: _minCardWidth,
                  maxWidth: _maxCardWidth,
                ),
                child: InfoCardWidget(
                  icon: card.icon,
                  title: card.title,
                  subtitle: card.subtitle,
                  detail: card.detail,
                  color: card.color,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
