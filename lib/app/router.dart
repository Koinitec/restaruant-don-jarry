import 'package:go_router/go_router.dart';
import 'package:restaruant_don_jarry/features/auth/presentation/screens/login_screen.dart';
import 'package:restaruant_don_jarry/features/home/presentation/screens/home_screens.dart';
import 'package:restaruant_don_jarry/features/inventory/presentation/screens/inventory_screens.dart';
import 'package:restaruant_don_jarry/shared/layouts/main_layout.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',

  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreens(),
        ),

        GoRoute(
          path: '/inventory',
          builder: (context, state) => const InventoryScreens(),
        ),
      ],
    ),
  ],
);
