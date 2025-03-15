import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../app/properties/properties_controller.dart';

class PropertiesBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(() => PropertiesController());

  }

}