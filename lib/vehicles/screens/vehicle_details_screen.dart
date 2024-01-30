import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/core/widgets/servisso_app_bar/servisso_app_bar.dart';
import 'package:servisso/vehicles/controllers/bloc_manage_vehicles.dart';

class VehicleDetailsScreen extends StatelessWidget {
  const VehicleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final manageVehiclesBloc = context.read<ManageVehiclesBloc>();
    final vehicle = manageVehiclesBloc.selectedVehicle;
    return Scaffold(
      appBar: ServissoAppBar(
        secondaryIcon: const Icon(
          Icons.delete_forever_rounded,
          size: 32,
        ),
        onSecondaryPressed: () {
          manageVehiclesBloc.add(RemoveVehicleEvent());
          context.pop();
        },
      ),
      body: Hero(
        tag: vehicle.toString(),
        child: Center(child: Text(vehicle.brand)),
      ),
    );
  }
}
