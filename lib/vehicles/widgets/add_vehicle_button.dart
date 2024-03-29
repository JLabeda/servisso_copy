import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/core/main.dart';

class AddVehicleButton extends StatelessWidget {
  const AddVehicleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text(AppLocalizations.of(context)!.addCar),
      backgroundColor: Theme.of(context).colorScheme.primary,
      onPressed: () => context.pushNamed(ServissoRoutes.addVehicle.name),
      icon: const Icon(Icons.add),
    );
  }
}
