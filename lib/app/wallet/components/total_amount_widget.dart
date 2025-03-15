import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class TotalAmountWidget extends StatelessWidget {
  const TotalAmountWidget({Key? key, required this.amount}) : super(key: key);
final RxString amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      margin: EdgeInsets.symmetric(horizontal: defaultPadding * 3 / 4),
      padding: EdgeInsets.all(defaultPadding / 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 5, color: primaryColor),
        color: white,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: defaultPadding / 2,
          children: [
            Text(
              "المبلغ",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  "\$",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  amount.value,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: secondaryColor),
                ),
              ],
            )
          ]),
    );
  }
}
