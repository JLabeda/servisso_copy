import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/authentication/screens/export.dart';
import 'package:servisso/landing_screen.dart';
import 'package:servisso/my_cars/pages/add_car_screen.dart';
import 'package:servisso/my_cars/pages/my_cars_screen.dart';

part 'theme.dart';
part 'go_router.dart';

void main() => runApp(const ServissoMobile());

class ServissoMobile extends StatelessWidget {
  const ServissoMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: _getTheme(context),
      routerConfig: _goRouter,
    );
  }
}
