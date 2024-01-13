import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:servisso/vehicles/models/vehicle/vehicle.dart';

part 'event_manage_vehicles.dart';
part 'state_manage_vehicles.dart';
part 'bloc_manage_vehicles.freezed.dart';
part 'bloc_manage_vehicles.g.dart';

class ManageVehiclesBloc
    extends Bloc<ManageVehiclesEvent, ManageVehiclesState> {
  ManageVehiclesBloc() : super(ManageVehiclesState.zero()) {
    on<ManageVehiclesEventAddNewVehicle>(_onAddNewVehicle);
  }

  FutureOr<void> _onAddNewVehicle(
    ManageVehiclesEventAddNewVehicle event,
    emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    // TODO(Janek): Implement proper BE Car adding
    emit(
      state.copyWith(
        vehicleList: List.from(state.vehicleList)..add(event.vehicle),
        isLoading: false,
      ),
    );
  }
}
