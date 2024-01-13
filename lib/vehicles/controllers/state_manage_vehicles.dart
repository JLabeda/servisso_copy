part of 'bloc_manage_vehicles.dart';

@freezed
class ManageVehiclesState with _$ManageVehiclesState {
  const factory ManageVehiclesState({
    required bool isLoading,
    required List<Vehicle> vehicleList,
  }) = _ManageVehiclesState;

  factory ManageVehiclesState.zero() => const ManageVehiclesState(
        isLoading: false,
        vehicleList: [],
      );

  factory ManageVehiclesState.fromJson(Map<String, Object?> json) =>
      _$ManageVehiclesStateFromJson(json);
}
