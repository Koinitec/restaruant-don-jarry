import 'package:go_router/go_router.dart';
import 'package:restaruant_don_jarry/features/auth/presentation/screens/login_screen.dart';
import 'package:restaruant_don_jarry/features/inventory/presentation/screens/inventory_screens.dart';
import 'package:restaruant_don_jarry/shared/layouts/main_layout.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/main', builder: (context, state) => const MainLayout()),
    GoRoute(
      path: '/inventory',
      builder: (context, state) => const InventoryScreens(),
    ),
  ],
);
