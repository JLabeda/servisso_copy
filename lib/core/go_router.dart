part of 'main.dart';

final _goRouter = GoRouter(
  routes: [
    GoRoute(
      name: ServissoRoutes.welcoming.name,
      path: ServissoRoutes.welcoming.path,
      builder: (context, state) => const WelcomingScreen(),
    ),
    GoRoute(
      name: ServissoRoutes.login.name,
      path: ServissoRoutes.login.path,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: ServissoRoutes.toWeb.name,
      path: ServissoRoutes.toWeb.path,
      builder: (context, state) => const ToWebScreen(),
    ),
    GoRoute(
      name: ServissoRoutes.createAccount.name,
      path: ServissoRoutes.createAccount.path,
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      name: ServissoRoutes.landing.name,
      path: ServissoRoutes.landing.path,
      builder: (context, state) => LandingScreen(),
    ),
    GoRoute(
        name: ServissoRoutes.myCars.name,
        path: ServissoRoutes.myCars.path,
        builder: (context, state) => const MyCarsScreen(),
        routes: [
          GoRoute(
            name: ServissoRoutes.addCar.name,
            path: ServissoRoutes.addCar.path,
            builder: (context, state) => const AddCarScreen(),
          ),
        ]),
  ],
);

enum ServissoRoutes {
  welcoming(path: '/', name: 'welcoming'),
  login(path: '/login', name: 'login'),
  toWeb(path: '/to-web', name: 'to-web'),
  createAccount(path: '/create-account', name: 'create-account'),
  landing(path: '/landing', name: 'landing'),
  myCars(path: '/my-cars', name: 'my-cars'),
  addCar(path: 'add-car', name: 'add-car');

  const ServissoRoutes({required this.name, required this.path});
  final String name;
  final String path;
}
