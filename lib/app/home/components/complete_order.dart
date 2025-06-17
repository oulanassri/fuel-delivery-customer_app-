import '../../../generated/assets.dart';
import '../../constants.dart';
import '../home_controller.dart';
import 'package:flutter/material.dart';

class CompleteOrder extends StatelessWidget {
  HomeController controller;

  /*RxString activeOrderStatus =
      "ontheway" //ontheway  arrivedlocation  startservicing
          .obs;*/

  CompleteOrder({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesOrderDone,
              height: 80,
              width: 80,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
