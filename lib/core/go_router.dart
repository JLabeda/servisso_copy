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
      name: ServissoRoutes.booting.name,
      path: ServissoRoutes.booting.path,
      builder: (context, state) => const BootingScreen(),
    ),
    GoRoute(
      name: ServissoRoutes.landing.name,
      path: ServissoRoutes.landing.path,
      builder: (context, state) => LandingScreen(),
    ),
    GoRoute(
      name: ServissoRoutes.myVehicles.name,
      path: ServissoRoutes.myVehicles.path,
      builder: (context, state) => const MyVehiclesScreen(),
      routes: [
        GoRoute(
          name: ServissoRoutes.addVehicle.name,
          path: ServissoRoutes.addVehicle.path,
          builder: (context, state) => AddVehicleScreen(),
        ),
        GoRoute(
          name: ServissoRoutes.vehicleDetails.name,
          path: ServissoRoutes.vehicleDetails.path,
          builder: (context, state) => const VehicleDetailsScreen(),
        ),
      ],
    ),
  ],
);

// TODO(Janek): As app gets bigger - move routes to separate file
enum ServissoRoutes {
  welcoming(path: '/', name: 'welcoming'),
  login(path: '/login', name: 'login'),
  toWeb(path: '/to-web', name: 'to-web'),
  createAccount(path: '/create-account', name: 'create-account'),
  booting(path: '/booting', name: 'booting'),
  landing(path: '/landing', name: 'landing'),
  myVehicles(path: '/my-vehicles', name: 'my-vehicles'),
  addVehicle(path: 'add-vehicle', name: 'add-vehicle'),
  vehicleDetails(path: 'vehicle-details', name: 'vehicle-details');

  const ServissoRoutes({required this.name, required this.path});
  final String name;
  final String path;
}
