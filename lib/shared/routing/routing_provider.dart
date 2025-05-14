import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../modules/authentication/pages/authentication_page.dart';
import '../../modules/home/pages/home_page.dart';
import '../authentication/store/authentication_provider.dart';

part 'routing_provider.g.dart';

class RouterAuthState {
  RouterAuthState({
    required this.isLoading,
    required this.hasError,
    required this.isAuthenticated,
  });

  final bool isLoading;
  final bool hasError;
  final bool isAuthenticated;
}

// 2. GoRouter Provider (using riverpod_annotation)
@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(
    authenticationStoreProvider.select(
      (state) => RouterAuthState(
        isLoading: state.isLoading,
        hasError: state.hasError,
        isAuthenticated: state.valueOrNull?.isAuthenticated ?? false,
      ),
    ),
  );
  // Use the authState to determine the initial route and redirection logic

  return GoRouter(
    initialLocation: AuthenticationPage.routeLocation, // Use route names
    debugLogDiagnostics: true, // Keep this for debugging
    routes: <RouteBase>[
      GoRoute(
        path: AuthenticationPage.routeLocation, // Use route names
        name: AuthenticationPage.routeName, // Use route names
        builder:
            (context, state) =>
                const AuthenticationPage(), // Use meaningful names
      ),
      GoRoute(
        path: HomePage.routeLocation, // Use route names
        name: HomePage.routeName, // Use route names
        builder: (context, state) => HomePage(), // Use meaningful names
      ),
    ],
    redirect: (context, state) {
      // Use RouteNames for comparison
      if (authState.isLoading || authState.hasError) return null;

      final isLoggingIn =
          state.matchedLocation == AuthenticationPage.routeLocation;

      if (!authState.isAuthenticated && !isLoggingIn) {
        return AuthenticationPage.routeLocation;
      }
      if (authState.isAuthenticated && isLoggingIn) {
        return HomePage.routeLocation;
      }

      return null;
    },
  );
}
