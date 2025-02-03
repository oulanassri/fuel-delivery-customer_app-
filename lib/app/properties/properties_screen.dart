import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../common/custom_material_button.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import '../properties/properties_controller.dart';

class PropertiesScreen extends GetView<PropertiesController> {
  const PropertiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PropertiesController());

    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: AppBar(
        title: Text("My Properties"),
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: gradientColorBg,
          ),
          child: Column(
            children: [
              SizedBox(
                height: defaultPadding * 2,
              ),
              Text(
                "No Properties",
                style:
                    TextStyle(color: primaryText, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: defaultPadding * 2,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: CustomMaterialButton1(
                      route: '',
                      text: 'Add Car',
                      buttonColor: secondaryColor,
                      textColor: white,
                    ),
                  ),
                  SizedBox(
                    width: defaultPadding,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: CustomMaterialButton1(
                      route: '',
                      text: 'Add House',
                      buttonColor: secondaryColor,
                      textColor: white,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
