import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        flexibleSpace: null,
        leading: GestureDetector(
          onTap: () => context.go('/'),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(24),
              ),
            ),
            width: 16,
            child: const Icon(
              Icons.arrow_back_sharp,
              size: 32,
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 64, 24, 32),
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
              Card(
                elevation: 8,
                child: TextFormField(
                  controller: _emailController,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 8,
                child: TextFormField(
                  controller: _passwordController,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Login'),
                ),
              ),
              const Spacer(),
              Text(
                'Don\'t have an account yet? No problem, you can click the button below in order to',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'create an account',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
