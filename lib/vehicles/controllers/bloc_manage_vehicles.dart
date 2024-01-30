import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:servisso/authentication/controllers/bloc_auth.dart';
import 'package:servisso/core/dartz_extension.dart';
import 'package:servisso/core/main.dart';
import 'package:servisso/core/servisso_exception.dart';
import 'package:servisso/vehicles/models/vehicle/vehicle.dart';
import 'package:servisso/vehicles/models/vehicle_scheme/vehicle_scheme.dart';
import 'package:servisso/vehicles/services/vehicles_service.dart';

part 'event_manage_vehicles.dart';
part 'state_manage_vehicles.dart';
part 'bloc_manage_vehicles.freezed.dart';

class ManageVehiclesBloc
    extends Bloc<ManageVehiclesEvent, ManageVehiclesState> {
  ManageVehiclesBloc({
    required VehiclesService service,
  })  : _service = service,
        super(ManageVehiclesState.zero()) {
    on<AddVehicleEvent>(_onAddNewVehicle);
    on<GetUserVehiclesEvent>(_onGetUserVehicles);
    on<SelectVehicleEvent>(_onSelectVehicle);
    on<RemoveVehicleEvent>(_onRemoveVehicle);
    on<ResetEvent>(_onReset);
  }

  final VehiclesService _service;
  final List<Vehicle> _vehicleList = [];
  late Vehicle selectedVehicle;

  void _onReset(ResetEvent event, Emitter emit) =>
      emit(ManageVehiclesState.zero());

  Future<void> _onAddNewVehicle(
    AddVehicleEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final userId = getIt.get<AuthBloc>().state.user!.id;
    final result = await _service.addVehicle(
      VehicleScheme(
        ownerId: userId,
        brand: event.brand,
        model: event.model,
        type: event.type,
        productionYear: event.productionYear,
        odometerValue: event.odometerValue,
      ),
    );
    if (result.isRight()) {
      emit(
        state.copyWith(
          isLoading: false,
          vehicleResult: Some(
            Right(
              _vehicleList..add(result.getRightOrThrow()),
            ),
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          vehicleResult: Some(Left(result.getLeftOrThrow())),
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _onGetUserVehicles(
    GetUserVehiclesEvent event,
    Emitter emit,
  ) async {
    final userId = getIt.get<AuthBloc>().state.user!.id;
    emit(state.copyWith(isLoading: true));
    final result = await _service.fetchUserVehicles(userId);
    if (result.isRight()) {
      _vehicleList.addAll(result.getRightOrThrow());
      emit(
        state.copyWith(
          isLoading: false,
          vehicleResult: Some(Right(result.getRightOrThrow())),
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          vehicleResult: Some(Left(result.getLeftOrThrow())),
        ),
      );
    }
  }

  Future<void> _onRemoveVehicle(
    RemoveVehicleEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _service.removeVehicle(selectedVehicle.id);
    if (result.isRight()) {
      // TODO(Janek): Ask backend to return new, reduced list?
      _vehicleList.removeWhere((element) => element.id == selectedVehicle.id);
      emit(
        state.copyWith(
          isLoading: false,
          vehicleResult: Some(Right(_vehicleList)),
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          vehicleResult: Some(Left(result.getLeftOrThrow())),
        ),
      );
    }
  }

  Future<void> _onSelectVehicle(
    SelectVehicleEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    selectedVehicle = event.vehicle;
    emit(state.copyWith(isLoading: false));
  }
}
