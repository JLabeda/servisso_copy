import 'dart:async';

import 'package:flutter/material.dart';

class ServissoProgressIndicator extends StatefulWidget {
  const ServissoProgressIndicator({super.key});

  @override
  State<ServissoProgressIndicator> createState() =>
      _ServissoProgressIndicatorState();
}

class _ServissoProgressIndicatorState extends State<ServissoProgressIndicator> {
  double _turns = 1;
  final _duration = const Duration(milliseconds: 1500);
  late final Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(
        _duration,
        (_) => setState(() {
              _turns += 1;
            }));
    Timer.run(() {
      setState(() {
        _turns += 1;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedRotation(
        curve: Curves.easeInOutCubic,
        turns: _turns,
        duration: _duration,
        child: Text(
          'S',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 64,
                foreground: Paint()
                  ..color = Theme.of(context).colorScheme.primary
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1,
              ),
        ),
      ),
    );
  }
}
