import 'package:flutter/material.dart';

class WelcomingScreen extends StatefulWidget {
  const WelcomingScreen({
    super.key,
  });

  @override
  State<WelcomingScreen> createState() => _WelcomingScreenState();
}

class _WelcomingScreenState extends State<WelcomingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome to Servisso! Please, tell us who You are... ',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 128,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('I am a car owner'),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('I am a car service owner'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
