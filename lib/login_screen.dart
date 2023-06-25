import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/core/widgets/servisso_app_bar.dart';
import 'package:servisso/core/widgets/servisso_elevated_button.dart';
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 64, 24, 48),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Login, in order to get full access to our system\'s features...',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 48),
              ServissoTextFormField(
                controller: _emailController,
                labelText: 'e-mail',
              ),
              const SizedBox(height: 36),
              ServissoTextFormField(
                controller: _passwordController,
                labelText: 'password',
              ),
              const SizedBox(height: 48),
              ServissoElevatedButton(
                child: const Text('Login'),
                onPressed: () => context.go('/landing'),
              ),
              const Spacer(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Don\'t have an account yet? No problem, you can click the highlighted text in order to',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextSpan(
                        text: ' create an account',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push('/create-account')),
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
