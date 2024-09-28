class NavigationItem {
  const NavigationItem({required this.routeName, required this.routePath});

  final String routeName;
  final String routePath;
}

//Sub-routes should not start with /
class Routes {
  static const NavigationItem homePage = NavigationItem(
    routeName: 'home',
    routePath: '/home',
  );
  static const NavigationItem profilePage = NavigationItem(
    routeName: 'profile',
    routePath: '/profile',
  );
  static const NavigationItem settingsPage = NavigationItem(
    routeName: 'settings',
    routePath: '/settings',
  );
  static const NavigationItem onboardingPage = NavigationItem(
    routeName: 'onboarding',
    routePath: '/onboarding',
  );
}
