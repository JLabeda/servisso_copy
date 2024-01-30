import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/core/main.dart';

class ServissoAppBarButton extends StatelessWidget {
  const ServissoAppBarButton({
    this.icon,
    this.onPressed,
    this.isLeading = true,
    super.key,
  });

  final Icon? icon;
  final void Function()? onPressed;
  final bool isLeading;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.85,
      child: ElevatedButton(
        style: ButtonStyle(
          shadowColor:
              MaterialStateProperty.all(Colors.black.withOpacity(0.15)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: isLeading
                  ? const BorderRadius.horizontal(right: Radius.circular(28))
                  : const BorderRadius.horizontal(left: Radius.circular(28)),
            ),
          ),
          padding: MaterialStateProperty.all(
            isLeading ? EdgeInsets.zero : const EdgeInsets.all(12),
          ),
        ),
        onPressed: onPressed ??
            () => context.canPop()
                ? context.pop()
                : context.goNamed(ServissoRoutes.landing.name),
        child: icon ?? const Icon(Icons.arrow_back_sharp, size: 32),
      ),
    );
  }
}
