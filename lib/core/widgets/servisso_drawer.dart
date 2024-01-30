import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/authentication/controllers/bloc_auth.dart';
import 'package:servisso/core/main.dart';

// TODO(Janek): Strings localization

class ServissoDrawer extends StatelessWidget {
  const ServissoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
            ],
          ),
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(64),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => context.goNamed(ServissoRoutes.landing.name),
                child: Text(
                  'Home',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => context.goNamed(ServissoRoutes.addVehicle.name),
                child: Text(
                  'Add vehicle',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Add service',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                'Settings',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(height: 8),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  context.read<AuthBloc>().add(LogoutEvent());
                  // TODO(Janek): Handle failing case (Show flushbar?)
                },
                child: Text(
                  'Logout',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
