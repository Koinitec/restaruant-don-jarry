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

            // Escala suave del tamaño del título
            final double titleFontSize = (width / 30).clamp(18, 28);

            return SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔹 Encabezado con menú
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
                              menuGroups: [
                                FItemGroup(
                                  children: [
                                    FItem(
                                      prefix: const Icon(FIcons.settings),
                                      title: const Text('Configuraciones'),
                                    ),
                                    FItem(
                                      prefix: const Icon(FIcons.logOut),
                                      title: const Text('Cerrar sesión'),
                                    ),
                                  ],
                                ),
                              ],
                              child: const Icon(FIcons.ellipsis),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // 🔹 Grid de tarjetas (ya responsivo sin if)
                        DashboardCards(
                          successColor: successColor,
                          dangerColor: dangerColor,
                        ),

                        const SizedBox(height: 24),

                        // 🔹 Actividad reciente
                        const RecentActivitySection(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
