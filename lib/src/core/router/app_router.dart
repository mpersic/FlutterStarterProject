import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_starter_project/src/core/router/router.dart';
import 'package:flutter_starter_project/src/ui/ui.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => const NotFoundScreen(),
    initialLocation: Routes.homePage.routePath,
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayout(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.homePage.routePath,
                name: Routes.homePage.routeName,
                pageBuilder: (context, state) => const MaterialPage(
                  child: HomeScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.settingsPage.routePath,
                name: Routes.settingsPage.routeName,
                pageBuilder: (context, state) => const MaterialPage(
                  child: SettingsScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: Routes.onboardingPage.routePath,
        name: Routes.onboardingPage.routeName,
        pageBuilder: (context, state) => const MaterialPage(
          child: OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: Routes.profilePage.routePath,
        name: Routes.profilePage.routeName,
        pageBuilder: (context, state) => const MaterialPage(
          child: ProfileScreen(),
        ),
      ),
    ],
  );
}
