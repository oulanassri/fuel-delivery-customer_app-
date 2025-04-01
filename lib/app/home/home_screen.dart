import 'package:delivery_fuel_customer/app/home/components/home.dart';
import 'package:delivery_fuel_customer/app/home/home_controller.dart';
import 'package:delivery_fuel_customer/app/location/location_picker_alert.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../routes/app_routes.dart';
import '../common/custom_app_bar.dart';
import '../common/custom_material_button.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import '../orders/components/previous_order.dart';
import 'components/active_order.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: CustomAppBar(
        title: "الواجهة الرّئيسيّة",
      ),
      body: Obx(
        () => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: gradientColorBg,
          ),
          child: controller.orderStatusId.value <10
              ? ActiveOrder(
                  controller: controller,
                )
              : Home(controller: controller,),
        ),
      ),
    );
  }
}
