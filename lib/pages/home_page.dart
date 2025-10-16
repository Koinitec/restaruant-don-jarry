import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/shared/headers/headers_.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(
          title: const Text('Inicio'),
          suffixes: [
            FHeaderAction(
              icon: const Icon(FIcons.settings),
              onPress: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Configuraciones presionado')),
                );
              },
            ),
          ],
        ),
        const Expanded(child: Center(child: Text('Página Home'))),
      ],
    );
  }
}
