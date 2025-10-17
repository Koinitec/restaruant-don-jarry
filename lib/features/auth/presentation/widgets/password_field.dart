import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  const PasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FTextFormField.password(
      controller: controller,
      hint: 'Contraseña',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => (value?.isNotEmpty ?? false)
          ? null
          : 'Por favor ingrese su contraseña',
    );
  }
}
