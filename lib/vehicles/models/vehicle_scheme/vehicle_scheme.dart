// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:servisso/vehicles/models/vehicle/vehicle.dart';

part 'vehicle_scheme.freezed.dart';
part 'vehicle_scheme.g.dart';

@freezed
class VehicleScheme with _$VehicleScheme {
  const factory VehicleScheme({
    @JsonKey(name: 'owner_id') required String ownerId,
    required String brand,
    required String model,
    required VehicleType type,
    @JsonKey(name: 'production_year') required int productionYear,
    @JsonKey(name: 'odometer') int? odometerValue,
  }) = _VehicleScheme;

  factory VehicleScheme.fromJson(Map<String, Object?> json) =>
      _$VehicleSchemeFromJson(json);
}
