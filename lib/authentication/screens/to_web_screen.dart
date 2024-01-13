import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:servisso/core/widgets/servisso_app_bar/servisso_app_bar.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.headToWebInfo,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 128,
              ),
              ServissoElevatedButton(
                onPressed: () => launchUrl(Uri.parse('https://www.google.com')),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.toWebPortal,
                    ),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      size: 32,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
