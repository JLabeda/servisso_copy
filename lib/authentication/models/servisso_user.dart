// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'servisso_user.freezed.dart';
part 'servisso_user.g.dart';

@freezed
class ServissoUser with _$ServissoUser {
  const factory ServissoUser({
    required String name,
    required String surname,
    required String email,
    required String id,
    @Default([]) List<String> vehicleIdList,
    @Default([]) List<String> servicesIdList,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ServissoUser;

  factory ServissoUser.fromJson(Map<String, Object?> json) =>
      _$ServissoUserFromJson(json);
}
