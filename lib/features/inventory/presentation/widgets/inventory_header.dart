import 'package:flutter/material.dart';
import 'package:restaruant_don_jarry/shared/widgets/headers/headers_widget.dart';

class InventoryHeader extends StatefulWidget {
  const InventoryHeader({super.key});

  @override
  State<InventoryHeader> createState() => _InventoryHeaderState();
}

class _InventoryHeaderState extends State<InventoryHeader> {
  @override
  Widget build(BuildContext context) {
    return HeaderWidget(
      title: Text(
        'Inventario',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      nested: true,
    );
  }
}
