import 'package:flutter/material.dart';

class ServissoElevatedButton extends StatelessWidget {
  const ServissoElevatedButton(
      {this.title, this.child, this.onPressed, super.key})
      : assert(child != null || title != null,
            'ServissonElevatedButton has to take either a title, or a child widget!'),
        assert(child == null || title == null,
            'ServissonElevatedButton can\'t take both title and child widget at the same time!');

  final String? title;
  final Widget? child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child ??
            Text(
              title!,
              textAlign: TextAlign.center,
            ),
      ),
    );
  }
}
