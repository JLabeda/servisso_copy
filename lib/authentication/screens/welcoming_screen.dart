import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/core/main.dart';
import 'package:servisso/core/widgets/servisso_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                AppLocalizations.of(context)!.welcomeInfo,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 128,
              ),
              ServissoElevatedButton(
                onPressed: () => context.pushNamed(ServissoRoutes.login.name),
                title: AppLocalizations.of(context)!.carOwner,
              ),
              const SizedBox(height: 32),
              ServissoElevatedButton(
                onPressed: () => context.pushNamed(ServissoRoutes.toWeb.name),
                title: AppLocalizations.of(context)!.carServiceOwner,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
