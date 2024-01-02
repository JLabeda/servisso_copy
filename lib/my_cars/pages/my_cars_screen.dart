import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servisso/core/widgets/servisso_app_bar/servisso_app_bar.dart';
import 'package:servisso/core/widgets/servisso_progress_indicator.dart';
import 'package:servisso/my_cars/controllers/bloc_manage_cars.dart';
import 'package:servisso/my_cars/widgets/add_car_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyCarsScreen extends StatelessWidget {
  const MyCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ServissoAppBar(),
      floatingActionButton: const AddCarButton(),
      body: BlocBuilder<ManageCarsBloc, ManageCarsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const ServissoProgressIndicator();
          } else if (state.carList.isEmpty) {
            return Center(
              child: Text(AppLocalizations.of(context)!.addFirstVehicle),
            );
          } else {
            return ListView.builder(
              itemCount: state.carList.length,
              itemBuilder: (context, index) {
                final car = state.carList[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  height: 240,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(24))),
                  child: Column(
                    children: [
                      const Flexible(child: Placeholder()),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Text(car.brand), Text(car.model)],
                            ),
                            Text(car.year.toString())
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
