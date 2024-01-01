import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServissoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ServissoAppBar(
      {this.titleWidget, this.leadingWidget, this.onLeadingPressed, super.key});

  final Widget? titleWidget;
  final Widget? leadingWidget;
  final void Function()? onLeadingPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: leadingWidget ??
          // TODO: Extract this button, to be reusable across app with different icons
          ElevatedButton(
            style: ButtonStyle(
                shadowColor:
                    MaterialStateProperty.all(Colors.black.withOpacity(0.15)),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(28)),
                  ),
                ),
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            onPressed: onLeadingPressed ?? () => context.pop(),
            child: const Icon(
              Icons.arrow_back_sharp,
              size: 32,
            ),
          ),
    );
  }
}
