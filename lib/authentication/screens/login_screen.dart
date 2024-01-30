import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/authentication/controllers/bloc_auth.dart';
import 'package:servisso/core/main.dart';
import 'package:servisso/core/widgets/servisso_app_bar/servisso_app_bar.dart';
import 'package:servisso/core/widgets/servisso_elevated_button.dart';
import 'package:servisso/core/widgets/servisso_progress_indicator.dart';
import 'package:servisso/core/widgets/servisso_text_form_field.dart';

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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (context.read<AuthBloc>().state.isLoginSuccess) {
            context.goNamed(ServissoRoutes.booting.name);
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const ServissoProgressIndicator();
          } else {
            return Padding(
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
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Please provide a valid email.';
                        }
                        return null;
                      },
                      controller: _emailController,
                      labelText: AppLocalizations.of(context)!.eMail,
                    ),
                    const SizedBox(height: 36),
                    ServissoTextFormField(
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Please provide a valid password.';
                        }
                        return null;
                      },
                      controller: _passwordController,
                      labelText: AppLocalizations.of(context)!.password,
                    ),
                    const SizedBox(height: 48),
                    ServissoElevatedButton(
                      title: AppLocalizations.of(context)!.login,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<AuthBloc>().add(
                                LoginEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
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
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.pushNamed(
                                    ServissoRoutes.createAccount.name,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
