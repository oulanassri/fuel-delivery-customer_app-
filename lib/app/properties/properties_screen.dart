import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
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
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              primaryColor,
              Colors.grey,
              primaryColor,
            ]),
          ),
          child: Column(children: [],)),
    );
  }
}
