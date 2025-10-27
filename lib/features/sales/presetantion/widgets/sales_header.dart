import 'package:flutter/material.dart';
import 'package:restaruant_don_jarry/shared/widgets/headers/headers_widget.dart';

class SalesHeader extends StatefulWidget {
  const SalesHeader({super.key});

  @override
  State<SalesHeader> createState() => _SalesHeaderState();
}

class _SalesHeaderState extends State<SalesHeader> {
  @override
  Widget build(BuildContext context) {
    return HeaderWidget(
      title: Text(
        'Ventas',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      nested: true,
    );
  }
}
