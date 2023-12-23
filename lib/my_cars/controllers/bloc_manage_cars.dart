import 'package:flutter_bloc/flutter_bloc.dart';

part 'event_manage_cars.dart';
part 'state_manage_cars.dart';

class ManageCarsBloc extends Bloc<_ManageCarsEvent, ManageCarsState> {
  ManageCarsBloc(super.initialState);
}
