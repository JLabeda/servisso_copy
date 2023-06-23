part of 'main.dart';

final _goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomingScreen(),
    ),
  ],
);
