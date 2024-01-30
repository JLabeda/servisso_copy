import 'package:dartz/dartz.dart';
import 'package:servisso/core/servisso_exception.dart';
import 'package:servisso/vehicles/models/vehicle/vehicle.dart';
import 'package:servisso/vehicles/models/vehicle_scheme/vehicle_scheme.dart';

abstract class VehiclesInterface {
  Future<Either<ServissoException, Vehicle>> addVehicle(
    VehicleScheme vehicle,
  );

  Future<Either<ServissoException, List<Vehicle>>> fetchUserVehicles(
    String userId,
  );

  Future<Either<ServissoException, Unit>> removeVehicle(
    String vehicleId,
  );
}
