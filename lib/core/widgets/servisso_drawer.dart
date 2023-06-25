import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServissoDrawer extends StatelessWidget {
  const ServissoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.horizontal(
          right: Radius.circular(64),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
        child: Column(children: [
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 32,
              ),
              Text(
                'Home',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 32,
              ),
              Text(
                'Add car',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 32,
              ),
              Text(
                'Add service',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.go('/');
              context.push('/login');
            },
            child: Row(
              children: [
                const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(
                  width: 32,
                ),
                Text(
                  'Logout',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
