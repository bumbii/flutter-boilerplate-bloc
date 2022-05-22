import 'package:bumbii/env/env.dart';
import 'package:bumbii/feature/landing/view/landing_page.dart';
import 'package:bumbii/feature/settings/view/settings_page.dart';
import 'package:go_router/go_router.dart';

// TODO: Implement Guard
class RoutePath {
  RoutePath._();

  static const String landing = '/';
  static const String selectSubject = '/login';
  static const String settings = '/settings';
}

final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: RoutePath.landing,
      builder: (context, state) {
        return const LandingPage();
      }),
  GoRoute(
      path: RoutePath.settings,
      builder: (context, state) {
        return const SettingsPage();
      }),
], debugLogDiagnostics: !prodEnv);

void goTo({required String path}) {
  router.go(path);
}

void goBack() {
  router.pop();
}
