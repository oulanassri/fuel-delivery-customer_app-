import 'dart:convert';

import 'package:delivery_fuel_customer/app/properties/properties_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:http/http.dart' as http;

import '../../models/city.dart';
import '../../models/neighborhood.dart';
import '../../models/properties.dart';
import '../../models/search_info.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/http/http_client.dart';

class AddingHouseController extends GetxController {
  late UserStorage storage;
  Position? currentPosition;
  var isLoading = false.obs;
  late GeoPoint currentPointPosition;
  late double latitude, longitude;
  var listSource = <SearchInfo>[].obs;

  TextEditingController houseLocationDetailsController =
      TextEditingController();

  List<CustomerCars> myCars = [];
  List<CityModel> cities = [];
  List<NeighborhoodModel> neighborhoodes = [];
  static final String _baseUrl = APIConstants.baseUrl;
  RxString selectedCity = "دمشق".obs;
  late RxInt selectedCityId = 1.obs;
  late RxInt selectedNeighborhoodId = 1.obs;
  Rx<String?> selectedNeighborhood = "المزة".obs;

//Int selectedCityId=1 as Int;
  @override
  void onInit() {
    print("onInit AddingHouseController");
    getCities();
    getCurrentLocation();
    getNeighborhood(cityId:1);
    super.onInit();
  }

  void setSelectedCity(String value) {

    selectedCity.value = value;
    //selectedCityId=id;
    for (int i = 0; i < cities.length; i++) {
      if (cities[i].name == value) {
        print(cities[i].id);
        selectedCityId.value = cities[i].id!;
        getNeighborhood(cityId: selectedCityId.value);
      }
    }
  }

  void setSelectedNeighborhood(String value) {
  //  neighborhoodes.clear();

    selectedNeighborhood.value = value;
    //selectedCityId=id;
    for (int i = 0; i < neighborhoodes.length; i++) {
      if (neighborhoodes[i].name == value) {
        selectedNeighborhoodId.value = neighborhoodes[i].id!;
      }
    }
  }

  Future<void> addApartment() async {
    print("addApartment");
    try {
      Map data = {
        "neighborhoodId": selectedNeighborhoodId.value,
        "cityId": selectedCityId.value,
        "name":UserStorage.read("name"),
        "phone": UserStorage.read("phone"),
        "lat": latitude,
        "long": longitude,
        "locationDescription": houseLocationDetailsController.text
      };
      print(data);
      Map<String, dynamic> body = await THttpHelper.post(
          endpoint: APIConstants.endPoints.addApartment, data: data);
      print(body);

      THelperFunctions.showSnackBar(
          message: 'تم إضافة المنزل بنجاح', title: 'إضافة منزل');
      //
    } catch (e) {
      print(e);
    }finally{
      PropertiesController controller = Get.find<PropertiesController>();
      controller.getProperties();

      Get.toNamed(Routes.PROPERTIES);
    }
  }

  Future<void> getCities() async {

    print("getCities");
    try {isLoading(true);
      final response = await http.get(
          Uri.parse('$_baseUrl${APIConstants.endPoints.getCities}'),
          headers: {
            'Content-Type': 'application/json',
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> body = json.decode(response.body);

        for (int i = 0; i < body.length; i++) {
          cities.add(CityModel(id: body[i]["id"], name: body[i]["name"]));
        }
        print(cities[0].name);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getNeighborhood({required int cityId}) async {

    print("getNeighborhood");
    try {isLoading(true);
      final response = await http.get(
          Uri.parse(
              '$_baseUrl${APIConstants.endPoints.getNeighborhood}?cityId=$cityId'),
          headers: {
            'Content-Type': 'application/json',
          });
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List body = json.decode(response.body);
        neighborhoodes.clear();
        for (int i = 0; i < body.length; i++) {
          neighborhoodes.add(
            NeighborhoodModel(
                id: body[i]["id"],
                name: body[i]["name"],
                cityId: body[i]["cityId"]),
          );
        }
        selectedNeighborhood.value = neighborhoodes[0].name;
        selectedNeighborhoodId.value= neighborhoodes[0].id!;
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location permissions are disabled');
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      print(
          'Location permissions are permanently denied,we cannot request permissions.');
      return;
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      /*   if (permission != LocationPermission.whileInUse && permission!=) {
        print('Location permissions are denied');
        return;
      }*/
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    currentPointPosition = GeoPoint(
      latitude: currentPosition!.latitude,
      longitude: currentPosition!.longitude,
    );
    //currentPointPosition=GeoPoint(currentPosition!.latitude, currentPosition!.longitude);
    print("latitude");
    print(currentPosition?.latitude);
    latitude = currentPosition!.latitude;
    print("longitude");
    print(currentPosition?.longitude);
    longitude = currentPosition!.longitude;
  }
}
