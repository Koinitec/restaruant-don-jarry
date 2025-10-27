import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({super.key, required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return FTextFormField.password(
      controller: widget.controller,
      hint: 'Contraseña',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => (value?.isNotEmpty ?? false)
          ? null
          : 'Por favor ingrese su contraseña',
    );
  }
}
