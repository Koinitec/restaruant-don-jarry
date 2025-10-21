import 'package:flutter/material.dart';
import 'package:restaruant_don_jarry/shared/widgets/headers/headers_widget.dart';

class UsersHeader extends StatelessWidget {
  const UsersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderWidget(
      title: Text(
        'Usuarios',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      nested: true,
    );
  }
}
