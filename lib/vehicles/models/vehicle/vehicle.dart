// ignore_for_file: invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    @JsonKey(name: 'user_id') required String userId,
    required String brand,
    required String model,
    required int year,
    int? mileage,
    DateTime? lastServiceAt,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, Object?> json) =>
      _$VehicleFromJson(json);
}
