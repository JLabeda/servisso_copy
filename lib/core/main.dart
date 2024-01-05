import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/authentication/screens/export.dart';
import 'package:servisso/landing_screen.dart';
import 'package:servisso/my_cars/controllers/bloc_manage_cars.dart';
import 'package:servisso/my_cars/pages/add_car_screen.dart';
import 'package:servisso/my_cars/pages/my_cars_screen.dart';

part 'theme.dart';
part 'go_router.dart';

void main() => runApp(const ServissoMobile());

class ServissoMobile extends StatelessWidget {
  const ServissoMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ManageCarsBloc(),
          )
        ],
        child: MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: _getTheme(context),
          routerConfig: _goRouter,
        ));
  }
}
