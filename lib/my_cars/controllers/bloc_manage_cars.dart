import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:servisso/my_cars/models/car/car.dart';

part 'event_manage_cars.dart';
part 'state_manage_cars.dart';
part 'bloc_manage_cars.freezed.dart';
part 'bloc_manage_cars.g.dart';

class ManageCarsBloc extends Bloc<_ManageCarsEvent, ManageCarsState> {
  ManageCarsBloc() : super(ManageCarsState.zero()) {
    on<ManageCarsEventAddNewCar>(_onAddNewCar);
  }

  FutureOr<void> _onAddNewCar(ManageCarsEventAddNewCar event, emit) async {
    emit(state.copyWith(isLoading: true));
    // TODO: Implement proper BE Car adding
    emit(state.copyWith(
      carList: List.from(state.carList)..add(event.car),
      isLoading: false,
    ));
  }
}
