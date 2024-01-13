part of 'bloc_manage_vehicles.dart';

sealed class ManageVehiclesEvent {}

class ManageVehiclesEventAddNewVehicle extends ManageVehiclesEvent {
  ManageVehiclesEventAddNewVehicle(this.vehicle);

  final Vehicle vehicle;
}

class ManageVehiclesEventEditVehicle extends ManageVehiclesEvent {
  ManageVehiclesEventEditVehicle({
    required this.id,
    required this.userId,
    required this.brand,
    required this.model,
    this.year,
    this.mileage,
  });

  final String id;
  final String userId;
  final String brand;
  final String model;
  final int? year;
  final int? mileage;
}

class ManageVehiclesEventRemoveVehicle extends ManageVehiclesEvent {
  ManageVehiclesEventRemoveVehicle({
    required this.vehicleId,
    required this.userId,
  });

  final String vehicleId;
  final String userId;
}
