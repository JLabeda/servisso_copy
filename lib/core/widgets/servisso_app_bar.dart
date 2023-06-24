import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServissoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ServissoAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      flexibleSpace: null,
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(24),
            ),
          ),
          width: 16,
          child: const Icon(
            Icons.arrow_back_sharp,
            size: 32,
          ),
        ),
      ),
    );
  }
}
