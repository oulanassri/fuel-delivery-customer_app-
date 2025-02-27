import 'package:delivery_fuel_customer/app/constants.dart';
import 'package:flutter/material.dart';

import '../../../models/fuel_type.dart';

class FuelTypeCard extends StatelessWidget {
  const FuelTypeCard({Key? key, required this.fuelType, required this.chosen}) : super(key: key);
  final FuelType fuelType;
final bool chosen;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      margin: EdgeInsets.symmetric(horizontal: defaultPadding*3/4),
      padding: EdgeInsets.all(defaultPadding / 4),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 5, color: Colors.black12),
        color: chosen?secondaryButton:white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: defaultPadding / 2,
        children: [
          Text(
            fuelType.type,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            fuelType.subType,
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
