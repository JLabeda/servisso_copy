import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/core/main.dart';

class ServissoAppBarButton extends StatelessWidget {
  const ServissoAppBarButton({
    this.icon,
    this.onLeadingPressed,
    super.key,
  });

  final Icon? icon;
  final void Function()? onLeadingPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.black.withOpacity(0.15)),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(28)),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: onLeadingPressed ??
          () => context.canPop()
              ? context.pop()
              : context.goNamed(ServissoRoutes.landing.name),
      child: icon ?? const Icon(Icons.arrow_back_sharp, size: 32),
    );
  }
}
