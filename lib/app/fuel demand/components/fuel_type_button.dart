import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../fuel_demand_controller.dart';

class FuelTypeButton extends StatelessWidget {
  const FuelTypeButton(
      {Key? key, required this.title, required this.controller})
      : super(key: key);
  final String title;
  final FuelDemandController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Container(
        padding: EdgeInsets.all(
          defaultPadding,
        ),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            color: controller.selectedFuelType.value == title
                ? primaryButton
                : bgColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              children: [
                Icon(
                  CommunityMaterialIcons.fuel,
                  color: white,
                  size: 30,
                ),
                SizedBox(
                  width: defaultPadding,
                ),
                Icon(
                  CommunityMaterialIcons.fuel,
                  color: Colors.black12,
                  size: 100,
                ),
              ],
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: secondaryText),
            ),
          ],
        ),
      ),
    );
  }
}
