import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/core/widgets/servisso_app_bar/servisso_app_bar.dart';
import 'package:servisso/core/widgets/servisso_elevated_button.dart';
import 'package:servisso/core/widgets/servisso_text_form_field.dart';
import 'package:servisso/vehicles/controllers/bloc_manage_vehicles.dart';
import 'package:servisso/vehicles/models/vehicle/vehicle.dart';

class AddVehicleScreen extends StatelessWidget {
  AddVehicleScreen({super.key});

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
            AppLocalizations.of(context)!.clear,
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
                      labelText: '${AppLocalizations.of(context)!.brand}*',
                    ),
                    const SizedBox(height: 36),
                    ServissoTextFormField(
                      controller: _modelController,
                      labelText: '${AppLocalizations.of(context)!.model}*',
                    ),
                    const SizedBox(height: 36),
                    ServissoTextFormField(
                      controller: _yearController,
                      labelText: '${AppLocalizations.of(context)!.year}*',
                    ),
                    const SizedBox(height: 36),
                    ServissoTextFormField(
                      controller: _mileaegeController,
                      labelText: '${AppLocalizations.of(context)!.mileage}*',
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
                        AppLocalizations.of(context)!.addCarPhoto,
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
                title: 'Add vehicle',
                onPressed: () {
                  context.read<ManageVehiclesBloc>().add(
                        // TODO(Janek): Fix clientId
                        ManageVehiclesEventAddNewVehicle(
                          Vehicle(
                            userId: '123123',
                            brand: _brandController.text,
                            model: _modelController.text,
                            year: int.parse(_yearController.text),
                            mileage: int.parse(_mileaegeController.text),
                          ),
                        ),
                      );
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
