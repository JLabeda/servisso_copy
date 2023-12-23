part of 'bloc_manage_cars.dart';

sealed class _ManageCarsEvent {}

class _ManageCarsEventAddNewCar extends _ManageCarsEvent {
  _ManageCarsEventAddNewCar(
      {required this.brand, required this.model, this.year, this.mileage});

  final String brand;
  final String model;
  final int? year;
  final int? mileage;
}

class _ManageCarsEventEditCar extends _ManageCarsEvent {
  _ManageCarsEventEditCar(
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

class _ManageCarsEventRemoveCar extends _ManageCarsEvent {
  _ManageCarsEventRemoveCar({required this.id, required this.clientId});

  final String id;
  final String clientId;
}
