import 'package:freezed_annotation/freezed_annotation.dart';

part 'servisso_exception.freezed.dart';

@freezed
class ServissoException with _$ServissoException {
  const factory ServissoException.auth([
    @Default(
      'Problem with authentication. Please try again later, or contact support.',
    )
    String message,
  ]) = _Auth;

  const factory ServissoException.vehicles([
    @Default(
      'Problem with vehicle management service. Please try again later, or contact support.',
    )
    String message,
  ]) = _Vehicles;

  const factory ServissoException.customMessage({required String message}) =
      _CustomMessage;
}
