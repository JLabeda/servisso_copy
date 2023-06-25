import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:servisso/core/widgets/servisso_app_bar.dart';
import 'package:servisso/core/widgets/servisso_elevated_button.dart';
import 'package:servisso/core/widgets/servisso_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _registerFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _serviceCodeController = TextEditingController();
  final _carBrandController = TextEditingController();
  final _carModelController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration.zero,
      () => showDialog(
        context: context,
        builder: (context) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Stack(clipBehavior: Clip.none, children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: const Color(0xFF00798C),
                ),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Text(
                'We require some of your basic information in order to enable smooth communication with car services',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 24),
              ),
            ),
            Positioned(
                top: -32,
                right: 0,
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                )),
          ]),
        ),
      ),
    );
    return Scaffold(
      appBar: ServissoAppBar(
        titleWidget: TextButton(
          onPressed: () => _registerFormKey.currentState!.reset(),
          child: Text(
            'clear',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
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
                      'Please provide some basic information in order to create a Servisso account.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 48),
                    ServissoTextFormField(
                      controller: _nameController,
                      labelText: 'name*',
                    ),
                    const SizedBox(height: 36),
                    ServissoTextFormField(
                      controller: _lastNameController,
                      labelText: 'surname*',
                    ),
                    const SizedBox(height: 36),
                    ServissoTextFormField(
                      controller: _emailController,
                      labelText: 'e-mail*',
                    ),
                    const SizedBox(height: 36),
                    ServissoTextFormField(
                      controller: _passwordController,
                      labelText: 'password*',
                    ),
                    const SizedBox(height: 36),
                    ServissoTextFormField(
                      controller: _serviceCodeController,
                      labelText: 'your car service unique code',
                    ),
                    const SizedBox(height: 36),
                    ServissoTextFormField(
                      controller: _carBrandController,
                      labelText: 'main car brand',
                    ),
                    const SizedBox(height: 36),
                    ServissoTextFormField(
                      controller: _carModelController,
                      labelText: 'main car model',
                    ),
                    const SizedBox(height: 24),
                    const Icon(
                      Icons.photo_camera_outlined,
                      color: Color(0xFF00798C),
                      size: 128,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'add a car photo',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w100,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ServissoElevatedButton(
                child: const Text('Create an account'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
