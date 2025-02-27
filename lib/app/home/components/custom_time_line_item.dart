import 'package:delivery_fuel_customer/app/home/components/status_card.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../constants.dart';

class CustomTimeLineItem extends StatelessWidget {
  final bool isFirst, isPast, isLast, isCompleted;
  final String status, date, description;

  CustomTimeLineItem(
      {Key? key,
      required this.isFirst,
      required this.isPast,
      required this.isLast,
      required this.status,
      required this.isCompleted,
      required this.date,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Column(
              children: [
                if (!isFirst)
                  Container(
                    width: 2,
                    height: 30,
                    color: isCompleted
                        ? primaryColor
                        : primaryText.withOpacity(0.2),
                  ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: isCompleted
                              ? primaryColor
                              : primaryText.withOpacity(0.2)),
                      shape: BoxShape.circle,
                      color: isCompleted
                          ? primaryColor
                          : primaryText.withOpacity(0.2)),
                  child: isCompleted
                      ? Icon(
                          Icons.check,
                          size: 16,
                          color: white,
                        )
                      : null,
                ),
                if (isFirst)
                  Container(
                    width: 2,
                    height: 50,
                    color: isCompleted
                        ? primaryColor
                        : primaryText.withOpacity(0.2),
                  ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 30,
                    color: isCompleted
                        ? primaryColor
                        : primaryText.withOpacity(0.2),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  right: defaultPadding / 2, bottom: defaultPadding),
              child: Column(
                spacing: defaultPadding / 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isCompleted ? primaryColor : secondaryColor),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                        fontSize: 12,
                        color: isCompleted ? primaryColor : secondaryColor),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                        fontSize: 14,
                        color: isCompleted ? primaryColor : secondaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*SizedBox(
      height: 200,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(color: primaryColor),
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: primaryColor,
          iconStyle: IconStyle(iconData: Icons.done, color: white),
        ),
        endChild: StatusCard(),
      ),
    )*/
