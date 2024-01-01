import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/core/main.dart';
import 'package:servisso/core/widgets/servisso_app_bar.dart';
import 'package:servisso/core/widgets/servisso_elevated_button.dart';
import 'package:servisso/core/widgets/servisso_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ServissoAppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 64, 24, 48),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.loginInfo,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 48),
              ServissoTextFormField(
                controller: _emailController,
                labelText: AppLocalizations.of(context)!.eMail,
              ),
              const SizedBox(height: 36),
              ServissoTextFormField(
                controller: _passwordController,
                labelText: AppLocalizations.of(context)!.password,
              ),
              const SizedBox(height: 48),
              ServissoElevatedButton(
                title: AppLocalizations.of(context)!.login,
                onPressed: () => context.goNamed(ServissoRoutes.landing.name),
              ),
              const Spacer(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.noAccountInfo,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextSpan(
                        text:
                            ' ${AppLocalizations.of(context)!.createAnAccount.toLowerCase()}',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context
                              .pushNamed(ServissoRoutes.createAccount.name)),
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
