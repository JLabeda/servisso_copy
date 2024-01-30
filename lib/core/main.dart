import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/authentication/controllers/bloc_auth.dart';
import 'package:servisso/authentication/screens/export.dart';
import 'package:servisso/authentication/services/auth_service.dart';
import 'package:servisso/core/dio/dio_client.dart';
import 'package:servisso/core/screens/booting_screen.dart';
import 'package:servisso/core/screens/landing_screen.dart';
import 'package:servisso/vehicles/controllers/bloc_manage_vehicles.dart';
import 'package:servisso/vehicles/screens/add_vehicle_screen.dart';
import 'package:servisso/vehicles/screens/my_vehicles_screen.dart';
import 'package:servisso/vehicles/screens/vehicle_details_screen.dart';
import 'package:servisso/vehicles/services/vehicles_service.dart';

part 'auth_listener.dart';
part 'go_router.dart';
part 'theme.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // TODO(Janek): Refactor - create seperate file that registers things, using injectable package? Consider if it's worth to make all controllers & services incjectable
  getIt.registerSingleton<DioClientBloc>(DioClientBloc());
  getIt.registerSingleton<AuthBloc>(AuthBloc(service: AuthService()));
  runApp(const ServissoMobile());
}

class ServissoMobile extends StatelessWidget {
  const ServissoMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<DioClientBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => ManageVehiclesBloc(service: VehiclesService()),
        ),
      ],
      child: AuthListener(
        router: _goRouter,
        child: MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: _getTheme(context),
          routerConfig: _goRouter,
        ),
      ),
    );
  }
}
