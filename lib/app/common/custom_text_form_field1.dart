import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomTextFormField1 extends StatelessWidget {
  CustomTextFormField1(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none),
      ),
    );
  }
}
