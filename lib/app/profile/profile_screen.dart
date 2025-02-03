
import 'package:delivery_fuel_customer/app/home/home_controller.dart';
import 'package:delivery_fuel_customer/app/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return Scaffold(
        drawer: CustomNavigationDrawer(),
        appBar: AppBar(title: Text("Profile"),centerTitle: true,),
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                primaryColor,
                Colors.grey,
                primaryColor,
              ]),
            ),
            child: Column()

        ));}}