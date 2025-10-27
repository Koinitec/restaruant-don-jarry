import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/models/card_info.dart';
import 'package:restaruant_don_jarry/shared/widgets/cards/info_card_widget.dart';

class DashboardCards extends StatefulWidget {
  static const double _maxContainerWidth = 1200.0;
  static const double _minCardWidth = 300.0;
  static const double _maxCardWidth = 520.0;
  static const double _cardSpacing = 24.0;
  static const double _padding = 16.0;

  final Color successColor;
  final Color dangerColor;

  const DashboardCards({
    super.key,
    required this.successColor,
    required this.dangerColor,
  });

  @override
  State<DashboardCards> createState() => _DashboardCardsState();
}

class _DashboardCardsState extends State<DashboardCards> {
  @override
  Widget build(BuildContext context) {
    final cards = [
      CardInfo(
        icon: FIcons.packageOpen,
        title: 'Inventario Crítico',
        subtitle: 'Papas, Pollo',
        detail: 'Revisar reposición',
        color: widget.dangerColor,
      ),
      CardInfo(
        icon: FIcons.dollarSign,
        title: 'Ventas del Día',
        subtitle: '\$4,120',
        detail: '↑ +15% respecto a ayer',
        color: widget.successColor,
      ),
    ];

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: DashboardCards._maxContainerWidth),
        child: Padding(
          padding: const EdgeInsets.all(DashboardCards._padding),
          child: Wrap(
            spacing: DashboardCards._cardSpacing,
            runSpacing: DashboardCards._cardSpacing,
            alignment: WrapAlignment.center,
            children: cards.map((card) {
              return ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: DashboardCards._minCardWidth,
                  maxWidth: DashboardCards._maxCardWidth,
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
