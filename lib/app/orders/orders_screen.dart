
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import 'orders_controller.dart';

class OrdersScreen extends GetView<OrdersController> {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());

    return Scaffold(
        drawer: CustomNavigationDrawer(),
        appBar: AppBar(title: Text("Orders"),centerTitle: true,),
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient:gradientColorBg,
            ),
            child: Column()

        ));}}