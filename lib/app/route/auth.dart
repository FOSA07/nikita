import 'package:go_router/go_router.dart';

import '../view/screen/authentication/login.dart';
import '../view/screen/authentication/signup.dart';

class AuthenticationRoutes {
  static List<RouteBase> getAuthRoutes() => <RouteBase>[
        GoRoute(
          path: 'login',
          name: 'signin',
          builder: (context, state) => const Login(),
        ),
        GoRoute(
          path: 'signup',
          name: 'signup',
          builder: (context, state) => const SignUp(),
        ),
  ];
}