import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../constants.dart';

class SettingsMenuWidget extends StatelessWidget {
  String title;
  IconData iconData;
  String data;
  RxBool open = false.obs;

  SettingsMenuWidget(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>GestureDetector(
      onTap: () {
        open.value = !(open.value);
      },
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: Icon(
            iconData,
            color: secondaryColor,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        trailing:open.value == false? Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: Icon(
             LineAwesomeIcons.angle_left_solid,
            color: primaryColor,
          ),
        ):null,
        subtitle: Text(
          open.value == true ? data : "",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    ));
  }
}
