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

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _registerFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ServissoAppBar(
        titleWidget: TextButton(
          onPressed: () => _registerFormKey.currentState!.reset(),
          child: Text(
            AppLocalizations.of(context)!.clear,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isUserValid) {
            context.goNamed(ServissoRoutes.landing.name);
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const ServissoProgressIndicator();
          } else {
            return Padding(
              padding: const EdgeInsets.fromLTRB(24, 36, 24, 48),
              child: Form(
                key: _registerFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListView(
                        controller: _scrollController,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.createAccountInfo,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(height: 48),
                          ServissoTextFormField(
                            controller: _nameController,
                            labelText: '${AppLocalizations.of(context)!.name}*',
                          ),
                          const SizedBox(height: 36),
                          ServissoTextFormField(
                            controller: _surnameController,
                            labelText:
                                '${AppLocalizations.of(context)!.surname}*',
                          ),
                          const SizedBox(height: 36),
                          ServissoTextFormField(
                            controller: _emailController,
                            labelText:
                                '${AppLocalizations.of(context)!.eMail}*',
                          ),
                          const SizedBox(height: 36),
                          ServissoTextFormField(
                            controller: _passwordController,
                            labelText:
                                '${AppLocalizations.of(context)!.password}*',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    ServissoElevatedButton(
                      title: AppLocalizations.of(context)!.createAnAccount,
                      onPressed: () => context.read<AuthBloc>().add(
                            RegisterEvent(
                              name: _nameController.text,
                              surname: _surnameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
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
