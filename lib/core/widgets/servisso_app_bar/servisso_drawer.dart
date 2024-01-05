import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/core/main.dart';

//TODO: Refactor: navigation, localization

class ServissoDrawer extends StatelessWidget {
  const ServissoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withOpacity(0.8),
          ]),
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(64),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              onTap: () => context.goNamed(ServissoRoutes.addCar.name),
              child: Text(
                'Add car',
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
                context.go('/');
                context.push('/login');
              },
              child: Text(
                'Logout',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
