import 'package:delivery_fuel_customer/app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../native_service/get_storage.dart';
import '../../../routes/app_routes.dart';
import '../../common/custom_material_button.dart';
import '../../constants.dart';
import '../../orders/components/previous_order.dart';

class Home extends StatelessWidget {
  Home({Key? key, required this.controller}) : super(key: key);
  HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(defaultPadding),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: gradientColorBg,
          ),
          child: Column(
            spacing: defaultPadding * 2,
            children: [
              SizedBox(
                height: defaultPadding * 2,
              ),
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 150,
                  width: 150,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: MaterialButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: "",
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomMaterialButton1(
                              route: Routes.CARFUELDEMAND,
                              text: 'سيّارة',
                            ),
                            CustomMaterialButton1(
                              route: Routes.HOUSEFUELDEMAND,
                              text: 'منزل',
                            ),
                          ],
                        ));
                  },
                  height: 50,

                  // margin: EdgeInsets.symmetric(horizontal: 50),
                  color: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  // decoration: BoxDecoration(
                  // ),
                  child: Center(
                    child: Text(
                      "تعبئة وقود",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
              Text(
                "عمليات التّعبئة السابقة",
                style: Theme.of(context).textTheme.titleLarge,
              ),
          //    PreviousOrder(),
           //   PreviousOrder(),
              SizedBox(
                height: defaultPadding,
              ),
              Text("current location of the user"),
              GestureDetector(
                onTap: () {
                  controller.getCurrentLocation();
                },
                child: Text("Get the current location"),
              ),
            //  Text("show in google map"),
              GestureDetector(
                onTap: () async {
                  print("show in google map");
                  controller.openMap(controller.currentPosition!.latitude.toString(),
                      controller.currentPosition!.longitude.toString());
                  /*   controller.currentPosition = // controller.getPosition();
                     controller.getAddress(controller.currentPosition?.latitude,
                        controller.currentPosition?.longitude);*/
                },
                child: Text("show in google map"),
              ),
            ],
          )),
    );
  }
}
