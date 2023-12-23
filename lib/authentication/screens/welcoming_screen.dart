import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/core/main.dart';
import 'package:servisso/core/widgets/servisso_elevated_button.dart';

class WelcomingScreen extends StatelessWidget {
  const WelcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to Servisso! Please, tell us who You are... ',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 128,
              ),
              ServissoElevatedButton(
                onPressed: () => context.pushNamed(ServissoRoutes.login.name),
                title: 'I am a car owner',
              ),
              const SizedBox(height: 32),
              ServissoElevatedButton(
                onPressed: () => context.pushNamed(ServissoRoutes.toWeb.name),
                title: 'I am a car service owner',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
