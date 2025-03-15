import 'package:delivery_fuel_customer/models/house.dart';
import 'package:flutter/material.dart';

import '../../../models/properties.dart';
import '../../constants.dart';

class HousePropertyCard extends StatelessWidget {
  const HousePropertyCard({Key? key, required this.apartments}) : super(key: key);
  final CustomerApartments apartments;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: defaultPadding,vertical: defaultPadding / 2),
      elevation: 5.0,
      color: Colors.white12,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: MediaQuery.of(context).size.width - defaultPadding ,
        padding: EdgeInsets.only(
          top: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: 200,
              child: Column(children: [Text(
                "${apartments.cityName}",
                maxLines: 10,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w600,
                  color: secondaryText,
                ),
              ),Text(
                "${apartments.neighborhoodName}",
                maxLines: 10,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w600,
                  color: secondaryText,
                ),
              ),Text(
                "${apartments.locationDescription}",
                maxLines: 10,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w600,
                  color: secondaryText,
                ),
              )],),
            ),
            Container(
              // height: 100,
              width: MediaQuery.of(context).size.width / 3,
              child: Image.asset(
                "assets/images/Home_FuelGo.png",
                //  fit: BoxFit.cover,
                //  height: 100,
                //  width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
