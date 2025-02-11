import 'package:go_router/go_router.dart';

import '../view/screen/authentication/login.dart';
import '../view/screen/features/features.dart';
import '../view/screen/onboard.dart';
import 'auth.dart';
import 'features.dart';

final GoRouter routes = GoRouter(
  initialLocation: '/onboard',

  routes: [
    GoRoute(
      path: '/onboard',
      name: 'onboard',
      builder: (context, state) => const Onboard(),
    ),
    GoRoute(
      path: '/auth',
      name: 'auth',
      builder: (context, state) => const Login(),
      routes: AuthenticationRoutes.getAuthRoutes(),
    ),
    GoRoute(
      path: '/nikita',
      name: 'nikita',
      builder: (context, state) => const Features(),
      routes: FeatureRoutes.getAuthRoutes(),
    ),
  ]
);