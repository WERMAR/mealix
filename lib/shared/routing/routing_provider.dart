import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../modules/authentication/pages/authentication_page.dart';
import '../../modules/home/pages/home_page.dart';
import '../authentication/store/authentication_provider.dart';

part 'routing_provider.g.dart';

// 1. Define Route Names (Important for consistency)
class RouteNames {
  static const String auth = '/auth';
  static const String home = '/home';
  // Add other routes as needed, e.g., for registration, forgot password
}

// 2. GoRouter Provider (using riverpod_annotation)
@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authenticationStoreProvider);

  return GoRouter(
    initialLocation: RouteNames.auth, // Use route names
    debugLogDiagnostics: true, // Keep this for debugging
    routes: <RouteBase>[
      GoRoute(
        path: RouteNames.auth, // Use route names
        builder:
            (context, state) =>
                const AuthenticationPage(), // Use meaningful names
      ),
      GoRoute(
        path: RouteNames.home, // Use route names
        builder: (context, state) => const HomePage(), // Use meaningful names
      ),
    ],
    redirect: (context, state) {
      // Use RouteNames for comparison
      if (authState.isLoading || authState.hasError) return null;

      final authStateObj = authState.valueOrNull;
      final isAuthenticated = authStateObj?.isAuthenticated ?? false;
      final isLoggingIn = state.matchedLocation == RouteNames.auth;

      if (!isAuthenticated && !isLoggingIn) return RouteNames.auth;
      if (isAuthenticated && isLoggingIn) return RouteNames.home;

      return null;
    },
  );
}
