import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton(
      {Key? key,
      required this.route,
      required this.text,
      required this.buttonColor,
      required this.textColor,
      required this.function})
      : super(key: key);
  final String route;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: function,
      height: 50,
      // margin: EdgeInsets.symmetric(horizontal: 50),
      color: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      // decoration: BoxDecoration(
      // ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tajawal'),
        ),
      ),
    );
  }
}
