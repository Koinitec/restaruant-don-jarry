import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/models/card_info.dart';
import 'package:restaruant_don_jarry/shared/widgets/cards/info_card_widget.dart';

class InventorySummaryCards extends StatefulWidget {
  final List<Map<String, dynamic>> products;

  const InventorySummaryCards({super.key, required this.products});

  static const _totalColor = Color(0xFFd35400);
  static const _lowColor = Color(0xFFf39c12);
  static const _outColor = Colors.redAccent;

  @override
  State<InventorySummaryCards> createState() => _InventorySummaryCardsState();
}

class _InventorySummaryCardsState extends State<InventorySummaryCards> {
  int get totalProducts => widget.products.length;

  int get lowCount => widget.products
      .where((p) => (p['stock'] ?? 0) < 20 && (p['stock'] ?? 0) > 0)
      .length;

  int get outCount =>
      widget.products.where((p) => (p['stock'] ?? 0) == 0).length;

  List<CardInfo> get _cards => [
    CardInfo(
      icon: FIcons.package,
      title: 'Total de Productos',
      subtitle: '$totalProducts',
      detail: '',
      color: InventorySummaryCards._totalColor,
    ),
    CardInfo(
      icon: FIcons.circleAlert,
      title: 'Stock Bajo',
      subtitle: '$lowCount',
      detail: '',
      color: InventorySummaryCards._lowColor,
    ),
    CardInfo(
      icon: FIcons.triangleAlert,
      title: 'Agotados',
      subtitle: '$outCount',
      detail: '',
      color: InventorySummaryCards._outColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        const minCardWidth = 300.0;
        const maxCardWidth = 420.0;
        const cardSpacing = 24.0;

        int columns = (width / (minCardWidth + cardSpacing)).floor().clamp(
          1,
          _cards.length,
        );

        final cardWidth = ((width - cardSpacing * (columns - 1)) / columns)
            .clamp(minCardWidth, maxCardWidth);

        return Center(
          child: Wrap(
            spacing: cardSpacing,
            runSpacing: cardSpacing,
            alignment: WrapAlignment.center,
            children: _cards
                .map(
                  (card) => SizedBox(
                    width: cardWidth,
                    child: InfoCardWidget(
                      icon: card.icon,
                      title: card.title,
                      subtitle: card.subtitle,
                      detail: card.detail,
                      color: card.color,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
