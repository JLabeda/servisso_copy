import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:servisso/authentication/controllers/bloc_auth.dart';
import 'package:servisso/core/main.dart';
import 'package:servisso/core/widgets/servisso_progress_indicator.dart';
import 'package:servisso/vehicles/controllers/bloc_manage_vehicles.dart';
import 'package:servisso/vehicles/models/vehicle/vehicle.dart';

class BootingScreen extends StatefulWidget {
  const BootingScreen({super.key});

  @override
  State<BootingScreen> createState() => _BootingScreenState();
}

class _BootingScreenState extends State<BootingScreen> {
  @override
  void initState() {
    getIt.get<AuthBloc>().add(GetUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.isUserValid) {
                context.read<ManageVehiclesBloc>().add(GetUserVehiclesEvent());
              }
            },
          ),
          BlocListener<ManageVehiclesBloc, ManageVehiclesState>(
            listener: (context, state) {
              if (state.vehicleList is List<Vehicle>) {
                context.goNamed(ServissoRoutes.landing.name);
              }
            },
          ),
        ],
        child: const Center(child: ServissoProgressIndicator()),
      ),
    );
  }
}
