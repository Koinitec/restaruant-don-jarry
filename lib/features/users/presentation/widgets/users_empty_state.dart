import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class UsersEmptyState extends StatelessWidget {
  const UsersEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = Colors.grey.shade600;
    final iconColor = Colors.grey.shade400;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.person_outline,
                size: MediaQuery.of(context).size.width < 400 ? 64 : 96,
                color: iconColor,
              ),
              const SizedBox(height: 20),
              Text(
                'No hay usuarios aún',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Agrega tu primer usuario para comenzar a gestionar los roles y permisos.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: textColor,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
