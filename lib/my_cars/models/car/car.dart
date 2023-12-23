// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'car.freezed.dart';
part 'car.g.dart';

@freezed
class Car with _$Car {
  const factory Car({
    @JsonKey(name: 'client_id') required String clientId,
    required String brand,
    required String model,
    required int year,
    int? mileage,
    DateTime? lastServiceAt,
  }) = _Car;

  factory Car.fromJson(Map<String, Object?> json) => _$CarFromJson(json);
}
