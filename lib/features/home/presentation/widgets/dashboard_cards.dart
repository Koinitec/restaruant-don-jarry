import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/widgets/cards/info_card_widget.dart';

class DashboardCards extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final cards = [
      DashboardCardData(
        icon: FIcons.packageOpen,
        title: 'Inventario Crítico',
        subtitle: 'Papas, Pollo',
        detail: 'Revisar reposición',
        color: dangerColor,
      ),
      DashboardCardData(
        icon: FIcons.dollarSign,
        title: 'Ventas del Día',
        subtitle: '\$4,120',
        detail: '↑ +15% respecto a ayer',
        color: successColor,
      ),
    ];

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _maxContainerWidth),
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: Wrap(
            spacing: _cardSpacing,
            runSpacing: _cardSpacing,
            alignment: WrapAlignment.center,
            children: cards.map((card) {
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

class DashboardCardData {
  final IconData icon;
  final String title;
  final String subtitle;
  final String detail;
  final Color color;

  const DashboardCardData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.detail,
    required this.color,
  });
}
