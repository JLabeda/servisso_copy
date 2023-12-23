import 'package:flutter/material.dart';
import 'package:servisso/core/widgets/servisso_app_bar.dart';
import 'package:servisso/my_cars/widgets/add_car_button.dart';

class MyCarsScreen extends StatelessWidget {
  const MyCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ServissoAppBar(),
      floatingActionButton: const AddCarButton(),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          height: 240,
          width: 300,
          decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))),
          child: const Column(
            children: [
              Flexible(child: Placeholder()),
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text('AAAA'), Text('BBBB')],
                  ),
                  Text('CCCC')
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
