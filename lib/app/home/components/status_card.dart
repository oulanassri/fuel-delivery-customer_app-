import 'package:delivery_fuel_customer/app/constants.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultPadding),
      padding:  EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(color: Colors.purple),
      child: Text("Hello"),
    );
  }
}
