part of 'main.dart';

final _goRouter = GoRouter(
  routes: [
    GoRoute(
      path: ServissoRoutes.welcoming.path,
      builder: (context, state) => const WelcomingScreen(),
    ),
    GoRoute(
      path: ServissoRoutes.login.path,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: ServissoRoutes.toWeb.path,
      builder: (context, state) => const ToWebScreen(),
    ),
    GoRoute(
      path: ServissoRoutes.createAccount.path,
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: ServissoRoutes.landing.path,
      builder: (context, state) => LandingScreen(),
    ),
  ],
);

enum ServissoRoutes {
  welcoming(path: '/', name: 'welcoming'),
  login(path: '/login', name: 'login'),
  toWeb(path: '/to-web', name: 'to-web'),
  createAccount(path: '/create-account', name: 'create-account'),
  landing(path: '/landing', name: 'landing');

  const ServissoRoutes({required this.name, required this.path});
  final String name;
  final String path;
}
