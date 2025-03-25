
import 'package:get/get.dart';

import '../app/fuel demand/car_demand_fuel_controller.dart';


class CarFuelDemandBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CarFuelDemandController());
  }

}