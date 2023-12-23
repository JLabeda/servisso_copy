import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/core/main.dart';

class AddCarButton extends StatelessWidget {
  const AddCarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        label: const Text('Add car'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => context.pushNamed(ServissoRoutes.addCar.name),
        icon: const Icon(Icons.add));
  }
}
