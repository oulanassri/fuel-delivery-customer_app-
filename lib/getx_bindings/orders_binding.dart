
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app/orders/orders_controller.dart';

class OrdersBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(OrdersController());
  }

}