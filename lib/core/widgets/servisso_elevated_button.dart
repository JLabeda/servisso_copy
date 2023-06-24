import 'package:flutter/material.dart';

class ServissoElevatedButton extends StatelessWidget {
  const ServissoElevatedButton(
      {required this.child, this.onPressed, super.key});

  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
