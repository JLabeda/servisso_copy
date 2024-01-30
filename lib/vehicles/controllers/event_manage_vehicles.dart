part of 'bloc_manage_vehicles.dart';

sealed class ManageVehiclesEvent {}

class ResetEvent extends ManageVehiclesEvent {
  ResetEvent();
}

class AddVehicleEvent extends ManageVehiclesEvent {
  AddVehicleEvent({
    required this.brand,
    required this.model,
    required this.productionYear,
    required this.odometerValue,
    required this.type,
  });
  final String brand;
  final String model;
  final int productionYear;
  final int odometerValue;
  final VehicleType type;
}

class GetUserVehiclesEvent extends ManageVehiclesEvent {}

class SelectVehicleEvent extends ManageVehiclesEvent {
  SelectVehicleEvent(this.vehicle);
  final Vehicle vehicle;
}

class RemoveVehicleEvent extends ManageVehiclesEvent {
  RemoveVehicleEvent();
}
