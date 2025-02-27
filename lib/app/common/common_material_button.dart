import 'package:flutter/material.dart';

import '../constants.dart';
class CommonMaterialButton extends StatelessWidget {
  String title;
  VoidCallback function;
   CommonMaterialButton({Key? key,required this.title,required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: MaterialButton(
        onPressed:
        function
        ,

        color: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        // decoration: BoxDecoration(
        // ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: secondaryText,
                fontWeight: FontWeight.bold,fontSize: 12,fontFamily: "Tajawal"),
          ),
        ),
      ),
    );
  }
}
