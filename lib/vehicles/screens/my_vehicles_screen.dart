import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/core/main.dart';
import 'package:servisso/core/widgets/servisso_app_bar/servisso_app_bar.dart';
import 'package:servisso/core/widgets/servisso_progress_indicator.dart';
import 'package:servisso/vehicles/controllers/bloc_manage_vehicles.dart';
import 'package:servisso/vehicles/widgets/add_vehicle_button.dart';
import 'package:servisso/vehicles/widgets/vehicle_tile.dart';

class MyVehiclesScreen extends StatelessWidget {
  const MyVehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const ServissoAppBar(),
      floatingActionButton: const AddVehicleButton(),
      body: BlocBuilder<ManageVehiclesBloc, ManageVehiclesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const ServissoProgressIndicator();
          } else if (state.vehicleList == null || state.vehicleList!.isEmpty) {
            return Center(
              child: Text(AppLocalizations.of(context)!.addFirstVehicle),
            );
          } else {
            return ListView.builder(
              itemCount: state.vehicleList!.length,
              itemBuilder: (context, index) {
                final vehicle = state.vehicleList![index];
                return Hero(
                  tag: vehicle.toString(),
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<ManageVehiclesBloc>()
                          .add(SelectVehicleEvent(vehicle));
                      context.pushNamed(ServissoRoutes.vehicleDetails.name);
                    },
                    child: VehicleTile(vehicle),
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
