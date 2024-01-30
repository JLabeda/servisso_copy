import 'package:flutter/material.dart';
import 'package:servisso/vehicles/models/vehicle/vehicle.dart';

// TODO(Janek): Placeholder widget - implement proper design when ready
class VehicleTile extends StatelessWidget {
  const VehicleTile(this.vehicle, {super.key});

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      height: 240,
      width: 300,
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const Flexible(
            flex: 5,
            child: Placeholder(),
          ),
          Flexible(
            flex: 4,
            child: Column(
              children: [
                RichText(text: TextSpan(text: vehicle.brand)),
                RichText(text: TextSpan(text: vehicle.model)),
                RichText(
                  text: TextSpan(text: vehicle.productionYear.toString()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
