import 'package:delivery_fuel_customer/app/wallet/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../common/custom_app_bar.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import 'components/total_amount_widget.dart';

class WalletScreen extends GetView<WalletController> {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(WalletController());

    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: CustomAppBar(
        title: "المحفظة",
      ),
      body: Container(
          padding: EdgeInsets.all(defaultPadding),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: gradientColorBg,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: defaultPadding,
            children:[
             TotalAmountWidget(amount: controller.wallet,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  "الرمز الخاص:",
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                ),
                Text(
                  "2342340",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: primaryColor),
                ),
              ],
            ),
            ],
          )),
    );
  }
}
