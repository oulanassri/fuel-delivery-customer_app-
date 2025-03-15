import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/properties.dart';
import '../../native_service/get_storage.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/helpers/helper_functions.dart';
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
  List<CustomerApartments> myApartments = [];
  //List<CustomerCars> myCars = <CustomerCars>[].obs;
  final isLoading = false.obs;

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
      getProperties();
      Get.back();
      THelperFunctions.showSnackBar(message: 'تم إضافة السيّارة', title: '');
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteCar({required String plateNumber}) async {
    print("deleteCar");

    try {
      final response = await http.patch(
        Uri.parse(
            '${APIConstants.baseUrl}${APIConstants.endPoints.deleteCar}?plateNum=$plateNumber'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${UserStorage.read('token')}'
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back();
        getProperties();
        THelperFunctions.showSnackBar(message: 'تم حذف السيّارة', title: '');
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
  Future<void> deleteApartment({required int id}) async {
    print("deleteApartment");

    try {
      final response = await http.patch(
        Uri.parse(
            '${APIConstants.baseUrl}${APIConstants.endPoints.deleteApartment}?aptId=$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${UserStorage.read('token')}'
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back();
        getProperties();
        THelperFunctions.showSnackBar(message: 'تم حذف المنزل', title: 'حذف منزل');
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
  Future<void> getProperties() async {

    print("getProperties");
    try {isLoading(true);
      Map<String, dynamic> body =
          await THttpHelper.get(APIConstants.endPoints.getMyProperties);
      print(body);
      PropertiesModel propertiesModel = PropertiesModel.fromJson(body);

      print(propertiesModel.customerCars?[0].plateNumber);
      myCars = propertiesModel.customerCars!;
      myApartments=propertiesModel.customerApartments!;
      //Get.back();
      update();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
