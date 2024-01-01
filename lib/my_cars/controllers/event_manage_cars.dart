part of 'bloc_manage_cars.dart';

sealed class _ManageCarsEvent {}

class ManageCarsEventAddNewCar extends _ManageCarsEvent {
  ManageCarsEventAddNewCar(this.car);

  final Car car;
}

class ManageCarsEventEditCar extends _ManageCarsEvent {
  ManageCarsEventEditCar(
      {required this.id,
      required this.clientId,
      required this.brand,
      required this.model,
      this.year,
      this.mileage});

  final String id;
  final String clientId;
  final String brand;
  final String model;
  final int? year;
  final int? mileage;
}

class ManageCarsEventRemoveCar extends _ManageCarsEvent {
  ManageCarsEventRemoveCar({required this.carId, required this.clientId});

  final String carId;
  final String clientId;
}
