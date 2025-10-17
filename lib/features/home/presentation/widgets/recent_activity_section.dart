import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Actividad Reciente',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        FCard(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'No hay pedidos recientes.\nLos pedidos completados aparecerán aquí.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
