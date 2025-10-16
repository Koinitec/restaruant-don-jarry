import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/layouts/main_layout.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  Application({super.key});

  final theme = FThemes.zinc.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Don Jarry',
      supportedLocales: FLocalizations.supportedLocales,
      localizationsDelegates: const [...FLocalizations.localizationsDelegates],
      theme: theme.toApproximateMaterialTheme(),
      builder: (_, child) => FAnimatedTheme(data: theme, child: child!),
      debugShowCheckedModeBanner: false,
      home: const MainApplication(),
    );
  }
}

class MainApplication extends StatefulWidget {
  const MainApplication({super.key});

  @override
  State<MainApplication> createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  @override
  Widget build(BuildContext context) {
    return const MainLayout();
  }
}
