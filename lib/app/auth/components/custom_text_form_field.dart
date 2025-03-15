import 'package:animate_do/animate_do.dart';
import 'package:delivery_fuel_customer/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.isPassword = false})
      : super(key: key);
  final String hintText;
  final TextEditingController controller;
  RxBool obscureText = true.obs;
  bool isPassword;

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
        obscureText: isPassword ? obscureText.value : false,
        controller: controller,
        decoration: InputDecoration(
            suffix: isPassword
                ? InkWell(
                    child: Obx(() => Icon(
                          obscureText.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: primaryColor,
                          size: 20,
                        )),
                    onTap: () {
                      obscureText.value=!(obscureText.value);
                      print(obscureText.value);
                    },
                  )
                : null,
            label: Text("أدخل $hintText"),
            labelStyle: Theme.of(context).textTheme.titleMedium,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none),
      ),
    );
  }
}
