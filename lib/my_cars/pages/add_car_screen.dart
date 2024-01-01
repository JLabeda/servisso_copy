import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:servisso/core/widgets/servisso_app_bar.dart';
import 'package:servisso/core/widgets/servisso_elevated_button.dart';
import 'package:servisso/core/widgets/servisso_text_form_field.dart';
import 'package:servisso/my_cars/controllers/bloc_manage_cars.dart';
import 'package:servisso/my_cars/models/car/car.dart';

class AddCarScreen extends StatelessWidget {
  AddCarScreen({super.key});

  final _registerFormKey = GlobalKey<FormState>();
  final _brandController = TextEditingController();
  final _modelController = TextEditingController();
  final _yearController = TextEditingController();
  final _mileaegeController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
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
                    const SizedBox(height: 48),
                    ServissoTextFormField(
                      controller: _brandController,
                      labelText: 'brand*',
                    ),
                    const SizedBox(height: 36),
                    ServissoTextFormField(
                      controller: _modelController,
                      labelText: 'model*',
                    ),
                    const SizedBox(height: 36),
                    ServissoTextFormField(
                      controller: _yearController,
                      labelText: 'year*',
                    ),
                    const SizedBox(height: 36),
                    ServissoTextFormField(
                      controller: _mileaegeController,
                      labelText: 'mileage*',
                    ),
                    const SizedBox(height: 48),
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
                  title: 'Add car',
                  onPressed: () {
                    context.read<ManageCarsBloc>().add(
                          //TODO: Fix clientId
                          ManageCarsEventAddNewCar(
                            Car(
                              clientId: '123123',
                              brand: _brandController.text,
                              model: _modelController.text,
                              year: int.parse(_yearController.text),
                              mileage: int.parse(_mileaegeController.text),
                            ),
                          ),
                        );
                    context.pop();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
