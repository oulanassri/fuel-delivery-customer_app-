import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/properties.dart';
import '../../native_service/get_storage.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/http/http_client.dart';

class PropertiesController extends GetxController {
  late UserStorage storage;
  TextEditingController plateNumberController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController yearOfManufactureController = TextEditingController();

  TextEditingController houseLocationDetailsController =
      TextEditingController();
  TextEditingController houseCityController = TextEditingController();
  TextEditingController houseNeighborhoodController = TextEditingController();

  List<CustomerCars> myCars = [];

  @override
  void onInit() {
    print("onInit PropertiesController");
    getProperties();
    storage = UserStorage();
    super.onInit();
  }

  Future<void> addCar() async {
    print("addCar");
    try {
      Map data = {
        "plateNumber": plateNumberController.text,
        "brand": brandController.text,
        "model": yearOfManufactureController.text,
        "color": colorController.text,
        "phone": UserStorage.read('phone'),
      };
      print(data);
      Map<String, dynamic> body = await THttpHelper.post(
          endpoint: APIConstants.endPoints.addCar, data: data);
      print(body);

      plateNumberController.clear();
      brandController.clear();
      yearOfManufactureController.clear();
      colorController.clear();

      Get.back();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getProperties() async {
    print("getProperties");
    try {
      Map<String, dynamic> body =
          await THttpHelper.get(APIConstants.endPoints.getMyProperties);
      PropertiesModel propertiesModel = PropertiesModel.fromJson(body);
      print(propertiesModel.customerCars?[0].plateNumber);
      myCars = propertiesModel.customerCars!;
      //Get.back();
    } catch (e) {
      print(e);
    }
  }
}
