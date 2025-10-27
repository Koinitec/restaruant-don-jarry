import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/models/card_info.dart';
import 'package:restaruant_don_jarry/shared/widgets/cards/info_card_widget.dart';

class SalesSummaryCards extends StatefulWidget {
  final List<Map<String, dynamic>> sales;

  const SalesSummaryCards({super.key, required this.sales});

  static const _totalColor = Color(0xFF16a085);
  static const _lowColor = Color(0xFFf39c12);
  static const _outColor = Colors.redAccent;

  @override
  State<SalesSummaryCards> createState() => _SalesSummaryCardsState();
}

class _SalesSummaryCardsState extends State<SalesSummaryCards> {
  int get totalSales => widget.sales.length;

  int get lowCount => widget.sales
      .where((s) => (s['stock'] ?? 0) < 20 && (s['stock'] ?? 0) > 0)
      .length;

  int get outCount => widget.sales.where((s) => (s['stock'] ?? 0) == 0).length;

  List<CardInfo> get _cards => [
    CardInfo(
      icon: FIcons.shoppingCart,
      title: 'Total de Ventas',
      subtitle: '$totalSales',
      detail: '',
      color: SalesSummaryCards._totalColor,
    ),
    CardInfo(
      icon: FIcons.circleAlert,
      title: 'Ventas Bajas',
      subtitle: '$lowCount',
      detail: '',
      color: SalesSummaryCards._lowColor,
    ),
    CardInfo(
      icon: FIcons.triangleAlert,
      title: 'Agotadas',
      subtitle: '$outCount',
      detail: '',
      color: SalesSummaryCards._outColor,
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
