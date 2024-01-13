import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:servisso/core/widgets/servisso_app_bar/servisso_app_bar.dart';
import 'package:servisso/core/widgets/servisso_progress_indicator.dart';
import 'package:servisso/vehicles/controllers/bloc_manage_vehicles.dart';
import 'package:servisso/vehicles/widgets/add_vehicle_button.dart';

class MyVehiclesScreen extends StatelessWidget {
  const MyVehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ServissoAppBar(),
      floatingActionButton: const AddVehicleButton(),
      body: BlocBuilder<ManageVehiclesBloc, ManageVehiclesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const ServissoProgressIndicator();
          } else if (state.vehicleList.isEmpty) {
            return Center(
              child: Text(AppLocalizations.of(context)!.addFirstVehicle),
            );
          } else {
            return ListView.builder(
              itemCount: state.vehicleList.length,
              itemBuilder: (context, index) {
                final vehicle = state.vehicleList[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  height: 240,
                  width: 300,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(24)),
                  ),
                  child: Column(
                    children: [
                      const Flexible(child: Placeholder()),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(vehicle.brand),
                                Text(vehicle.model),
                              ],
                            ),
                            Text(vehicle.year.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
