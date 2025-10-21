import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/models/card_info.dart';
import 'package:restaruant_don_jarry/shared/widgets/cards/info_card_widget.dart';

class UsersSummaryCards extends StatelessWidget {
  final List<Map<String, dynamic>> users;

  const UsersSummaryCards({super.key, required this.users});

  static const _totalColor = Color(0xFFd35400);
  static const _adminColor = Color(0xFFf39c12);
  static const _sellerColor = Colors.redAccent;

  int get totalUsers => users.length;

  int get adminCount => users.where((u) => (u['role'] ?? '') == 'admin').length;

  int get sellerCount =>
      users.where((u) => (u['role'] ?? '') == 'seller').length;

  List<CardInfo> get _cards => [
    CardInfo(
      icon: FIcons.users,
      title: 'Total Usuarios',
      subtitle: '$totalUsers',
      detail: '',
      color: _totalColor,
    ),
    CardInfo(
      icon: FIcons.userCheck,
      title: 'Administradores',
      subtitle: '$adminCount',
      detail: '',
      color: _adminColor,
    ),
    CardInfo(
      icon: FIcons.triangleAlert,
      title: 'Vendedores',
      subtitle: '$sellerCount',
      detail: '',
      color: _sellerColor,
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
