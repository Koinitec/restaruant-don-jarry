import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController controller;
  const UsernameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FTextFormField(
      controller: controller,
      hint: 'Nombre de usuario',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => (value?.isNotEmpty ?? false)
          ? null
          : 'Por favor ingrese su nombre de usuario',
    );
  }
}
