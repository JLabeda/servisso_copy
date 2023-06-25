part of 'main.dart';

final _goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/to-web',
      builder: (context, state) => const ToWebScreen(),
    ),
    GoRoute(
      path: '/create-account',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/landing',
      builder: (context, state) => LandingScreen(),
    ),
  ],
);
