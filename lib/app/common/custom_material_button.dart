import 'package:delivery_fuel_customer/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class CustomMaterialButton1 extends StatelessWidget {
  const CustomMaterialButton1(
      {Key? key, required this.route, required this.text, })
      : super(key: key);
  final String route;
  final String text;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Get.toNamed(route);
      },
      height: 50,
      // margin: EdgeInsets.symmetric(horizontal: 50),
      color: primaryButton,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      // decoration: BoxDecoration(
      // ),
      child: Center(
        child: Text(
          text,
          style:Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
