import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:servisso/core/dio/dio_client.dart';
import 'package:servisso/core/main.dart';
import 'package:servisso/core/servisso_exception.dart';
import 'package:servisso/vehicles/interface/vehicles_interface.dart';
import 'package:servisso/vehicles/models/vehicle/vehicle.dart';
import 'package:servisso/vehicles/models/vehicle_scheme/vehicle_scheme.dart';

class VehiclesService implements VehiclesInterface {
  VehiclesService();

  late DioClient dioClient = getIt.get<DioClientBloc>().state;

  @override
  Future<Either<ServissoException, Vehicle>> addVehicle(
    VehicleScheme vehicle,
  ) async {
    try {
      final response =
          await dioClient.dio.post('vehicles', data: vehicle.toJson());
      return Right(Vehicle.fromJson(response.data as Map<String, dynamic>));
    } catch (e) {
      log('Error: $e');
      return const Left(ServissoException.auth());
    }
  }

  @override
  Future<Either<ServissoException, List<Vehicle>>> fetchUserVehicles(
    String userId,
  ) async {
    try {
      final response = await dioClient.dio.get('users/$userId/vehicles');
      final jsonList = response.data as List;
      return Right(
        List<Vehicle>.from(
          jsonList.map((j) => Vehicle.fromJson(j as Map<String, dynamic>)),
        ),
      );
    } catch (e) {
      log('Error: $e');
      return const Left(ServissoException.auth());
    }
  }

  @override
  Future<Either<ServissoException, Unit>> removeVehicle(
    String vehicleId,
  ) async {
    try {
      await dioClient.dio.delete('vehicles/$vehicleId');
      return const Right(unit);
    } catch (e) {
      log('Error: $e');
      return const Left(ServissoException.auth());
    }
  }
}
