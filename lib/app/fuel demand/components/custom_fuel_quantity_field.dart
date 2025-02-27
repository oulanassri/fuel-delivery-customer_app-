import 'package:animate_do/animate_do.dart';
import 'package:delivery_fuel_customer/app/constants.dart';
import 'package:flutter/material.dart';

class CustomFuelQuantityField extends StatelessWidget {
  CustomFuelQuantityField(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            label: Text("Enter ${hintText}"),
            labelStyle: TextStyle(color: primaryText),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none),
      ),
    );
  }
}
