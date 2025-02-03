import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomAddMaterialButton extends StatelessWidget {
  const CustomAddMaterialButton(
      {Key? key,
      required this.route,
      required this.text,
      required this.buttonColor,
      required this.textColor})
      : super(key: key);
  final String route;
  final String text;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Get.defaultDialog(
            title: "Add Car",
            content: Column(
              children: [],
            ),
            onConfirm: () {
              print("confirm");
            },
            onCancel: () {
              print("cancel");
            });
      },
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
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
