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
          const Flexible(child: Placeholder()),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(vehicle.brand),
                    Text(vehicle.model),
                  ],
                ),
                Text(vehicle.productionYear.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
