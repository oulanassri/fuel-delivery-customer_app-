import 'package:get/get.dart';

import '../app/fuel demand/fuel_demand_controller.dart';

class FuelDemandBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FuelDemandController());
  }

}