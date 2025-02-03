import 'package:delivery_fuel_customer/app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../common/custom_material_button.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
        drawer: CustomNavigationDrawer(),
        appBar: AppBar(
          title: Text("Home"),
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
                Center(
                  child: Icon(
                    Maki.fuel,
                    color: white,
                    size: 100,
                  ),
                ),
                SizedBox(
                  height: defaultPadding * 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: CustomMaterialButton1(
                    route: '',
                    text: 'Fill it up',
                    buttonColor: secondaryColor,
                    textColor: white,
                  ),
                ),
              ],
            )));
  }
}
