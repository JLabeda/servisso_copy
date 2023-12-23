import 'package:flutter/material.dart';
import 'package:servisso/core/widgets/servisso_app_bar.dart';

import 'package:servisso/core/widgets/servisso_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ToWebScreen extends StatelessWidget {
  const ToWebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ServissoAppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'This mobile app is designed to be used by car owners - Your clients. If You are a car mechanic, please visit our Servisso web portal ',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 128,
              ),
              ServissoElevatedButton(
                  onPressed: () =>
                      launchUrl(Uri.parse('https://www.google.com')),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('To web portal...'),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 32,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
