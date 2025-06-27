import 'package:delivery_fuel_customer/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../models/car.dart';
import '../../../models/properties.dart';

class CarPropertyCard extends StatelessWidget {
  const CarPropertyCard({Key? key, required this.car}) : super(key: key);
  final CustomerCars car;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      elevation: 5.0,
      color: Colors.white12,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: MediaQuery.of(context).size.width - defaultPadding * 2,
        padding: EdgeInsets.only(
          top: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              // height: 100,
              width: MediaQuery.of(context).size.width / 4,
              child: Image.asset(
                "assets/images/Car_FuelGo.png",
                //  fit: BoxFit.cover,
                //  height: 100,
                //  width: 100,
              ),
            ),
            Container(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                spacing: 10,
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: 100,
                    child: Text(
                      "${car.plateNumber} ",
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w600,
                        color: secondaryText,
                      ),
                    ),
                  ),
                  Container(width: 200,
                   alignment: Alignment.center,
                    child: Text(
                      " ${car.brand} ${car.model}",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w600,
                        color: secondaryText,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "${car.color} ",
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w600,
                        color: secondaryText,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
