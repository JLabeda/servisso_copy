import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:servisso/core/widgets/servisso_app_bar.dart';
import 'package:servisso/my_cars/pages/widgets/add_car_button.dart';

class MyCarsScreen extends StatelessWidget {
  const MyCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ServissoAppBar(),
      floatingActionButton: AddCarButton(),
    );
  }
}
