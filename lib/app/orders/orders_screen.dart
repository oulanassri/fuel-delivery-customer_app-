import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../common/custom_app_bar.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import 'components/previous_order.dart';
import 'orders_controller.dart';

class OrdersScreen extends GetView<OrdersController> {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());

    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: CustomAppBar(
        title: "الطّلبات",
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradientColorBg,
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: defaultPadding,
            children: [
              SizedBox(
                height: defaultPadding * 2,
              ),
              PreviousOrder(),
              PreviousOrder(),
              SizedBox(
                height: defaultPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
