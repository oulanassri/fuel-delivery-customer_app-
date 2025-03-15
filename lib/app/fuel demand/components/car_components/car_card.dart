import 'package:delivery_fuel_customer/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../models/car.dart';
import '../../../../models/properties.dart';

class CarCard extends StatelessWidget {
  const CarCard({Key? key, required this.car, required this.chosen})
      : super(key: key);
  final CustomerCars car;
  final bool chosen;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
      elevation: 5.0,
      color: chosen ? secondaryButton : Colors.white12,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.only(
          top: 15,
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            Container(
              // height: 100,
              //width:   MediaQuery.of(context).size.width/2,
              child: Image.asset(
                "assets/images/Car_FuelGo.png",
                fit: BoxFit.contain,
              ),
            ),
            Column(spacing: 10,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                        "${car.plateNumber} ",
                        style: Theme.of(context).textTheme.headlineSmall)),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                        " ${car.brand} ${car.model}",
                        style: Theme.of(context).textTheme.headlineSmall)),
                Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left: 12),
                    child: Text("${car.color} ",
                        style: Theme.of(context).textTheme.headlineSmall)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
