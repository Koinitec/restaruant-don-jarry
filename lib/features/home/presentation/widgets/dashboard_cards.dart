import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/widgets/cards/info_card_widget.dart';

class DashboardCardData {
  final IconData icon;
  final String title, subtitle, detail;
  final Color color;

  const DashboardCardData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.detail,
    required this.color,
  });
}

class DashboardCards extends StatelessWidget {
  final Color successColor, dangerColor;
  final int crossAxisCount;

  const DashboardCards({
    super.key,
    required this.successColor,
    required this.dangerColor,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    final cards = [
      DashboardCardData(
        icon: FIcons.packageOpen,
        title: 'Inventario Crítico',
        subtitle: 'Papas, Pollo Extra, Refrescos',
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

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2,
      ),
      itemCount: cards.length,
      itemBuilder: (_, i) {
        final c = cards[i];
        return InfoCardWidget(
          icon: c.icon,
          title: c.title,
          subtitle: c.subtitle,
          detail: c.detail,
          color: c.color,
        );
      },
    );
  }
}
