import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:restaruant_don_jarry/app/router.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  Application({super.key});

  final theme = FThemes.zinc.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Restaurant Don Jarry',
      supportedLocales: FLocalizations.supportedLocales,
      localizationsDelegates: const [...FLocalizations.localizationsDelegates],
      theme: theme.toApproximateMaterialTheme(),
      builder: (_, child) => FAnimatedTheme(data: theme, child: child!),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
