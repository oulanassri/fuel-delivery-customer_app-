import 'package:delivery_fuel_customer/app/wallet/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';

class WalletScreen extends GetView<WalletController> {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(WalletController());

    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: AppBar(
        title: Text("My Wallet"),
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
          child: Column()),
    );
  }
}
