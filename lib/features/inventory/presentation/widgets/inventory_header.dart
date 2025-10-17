import 'package:flutter/material.dart';
import 'package:restaruant_don_jarry/shared/widgets/headers/headers_widget.dart';

class InventoryHeader extends StatelessWidget {
  const InventoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const HeaderWidget(
      title: Text(
        'Inventario',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      nested: true,
    );
  }
}
