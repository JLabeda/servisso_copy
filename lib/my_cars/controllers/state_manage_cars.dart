part of 'bloc_manage_cars.dart';

@freezed
class ManageCarsState with _$ManageCarsState {
  const factory ManageCarsState({
    required bool isLoading,
    required List<Car> carList,
  }) = _ManageCarsState;

  factory ManageCarsState.zero() => const ManageCarsState(
        isLoading: false,
        carList: [],
      );

  factory ManageCarsState.fromJson(Map<String, Object?> json) =>
      _$ManageCarsStateFromJson(json);
}
