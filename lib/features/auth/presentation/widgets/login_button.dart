import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPress;
  const LoginButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FButton(
        onPress: onPress,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text('Login', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
