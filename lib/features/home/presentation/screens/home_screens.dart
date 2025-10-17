import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/widgets/headers/popover_menu_widget.dart';
import '../widgets/dashboard_cards.dart';
import '../widgets/recent_activity_section.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  // Paleta de colores tipo KFC
  Color get primaryColor => const Color(0xFFd35400);
  Color get successColor => const Color(0xFF27ae60);
  Color get dangerColor => Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final double titleFontSize = (width / 30).clamp(18, 28);
            final int crossAxisCount = (width ~/ 300).clamp(1, 2);

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header con menú desplegable
                  FHeader(
                    title: Text(
                      'Panel de Ventas',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    suffixes: [
                      PopoverMenuWidget(
                        maxHeight: width < 600
                            ? 200
                            : (width < 1024 ? 250 : 300),
                        menuGroups: [
                          FItemGroup(
                            children: [
                              FItem(
                                prefix: Icon(FIcons.settings),
                                title: const Text('Configuraciones'),
                              ),
                              FItem(
                                prefix: Icon(FIcons.logOut),
                                title: const Text('Cerrar sesión'),
                              ),
                            ],
                          ),
                        ],
                        child: Icon(FIcons.ellipsis),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Grid de tarjetas del dashboard
                  DashboardCards(
                    successColor: successColor,
                    dangerColor: dangerColor,
                    crossAxisCount: crossAxisCount,
                  ),

                  const SizedBox(height: 24),

                  // Sección de actividad reciente
                  const RecentActivitySection(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
