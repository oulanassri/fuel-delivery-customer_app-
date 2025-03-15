import 'package:get/get.dart';

import '../app/properties/adding_house_controller.dart';


class AddingHouseBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AddingHouseController());
  }

}