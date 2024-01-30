// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    required String id,
    @JsonKey(name: 'owner_id') required String ownerId,
    required String brand,
    required String model,
    required VehicleType type,
    @JsonKey(name: 'production_year') required int productionYear,
    @JsonKey(name: 'odometer') int? odometerValue,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'last_service_at') DateTime? lastServiceAt,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, Object?> json) =>
      _$VehicleFromJson(json);
}

enum VehicleType {
  passenger,
  motorcycle,
  delivery,
  construction,
  bus,
  agricultural,
  trailer,
  camper
}
