import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/authentication/controllers/bloc_auth.dart';
import 'package:servisso/authentication/screens/export.dart';
import 'package:servisso/authentication/services/auth_service.dart';
import 'package:servisso/core/dio/dio_client.dart';
import 'package:servisso/core/landing_screen.dart';

import 'package:servisso/vehicles/controllers/bloc_manage_vehicles.dart';
import 'package:servisso/vehicles/pages/add_vehicle_screen.dart';
import 'package:servisso/vehicles/pages/my_vehicles_screen.dart';

part 'auth_listener.dart';
part 'go_router.dart';
part 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ServissoMobile());
}

class ServissoMobile extends StatelessWidget {
  const ServissoMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(Janek): This sollution may potentailly lead to app loosing state when token is refreshed. To be investigated when we have more data
    final dioBloc = DioClientBloc();
    DioClient dio = dioBloc.state;
    dioBloc.stream.listen((event) {
      dio = event;
    });
    return BlocProvider(
      create: (context) => dioBloc,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              service: AuthService(dio),
            ),
          ),
          BlocProvider(
            create: (context) => ManageVehiclesBloc(),
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
      ),
    );
  }
}
