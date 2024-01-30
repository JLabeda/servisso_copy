part of 'bloc_manage_vehicles.dart';

@freezed
class ManageVehiclesState with _$ManageVehiclesState {
  const factory ManageVehiclesState({
    required bool isLoading,
    required Option<Either<ServissoException, List<Vehicle>>> vehicleResult,
  }) = _ManageVehiclesState;

  factory ManageVehiclesState.zero() => ManageVehiclesState(
        isLoading: false,
        vehicleResult: none(),
      );
}

extension ManageVehiclesStateExt on ManageVehiclesState {
  List<Vehicle>? get vehicleList => vehicleResult.fold(
        () => null,
        (a) => a.fold((l) => null, (r) => r),
      );
}
