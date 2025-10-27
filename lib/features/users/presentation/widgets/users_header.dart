import 'package:flutter/material.dart';
import 'package:restaruant_don_jarry/shared/widgets/headers/headers_widget.dart';

class UsersHeader extends StatefulWidget {
  const UsersHeader({super.key});

  @override
  State<UsersHeader> createState() => _UsersHeaderState();
}

class _UsersHeaderState extends State<UsersHeader> {
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
