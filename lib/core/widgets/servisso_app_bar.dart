import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServissoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ServissoAppBar({this.titleWidget, this.leadingWidget, super.key});

  final Widget? titleWidget;
  final Widget? leadingWidget;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: leadingWidget ??
          GestureDetector(
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
