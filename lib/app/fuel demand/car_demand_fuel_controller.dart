
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/city.dart';
import '../../models/fuel_details.dart';
import '../../models/neighborhood.dart';
import '../../models/properties.dart';
import '../../models/search_info.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/http/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../home/home_controller.dart';
class CarFuelDemandController extends GetxController {
  final String token = UserStorage.read('token');
  late double latitude, longitude;
  Position? currentPosition;

  RxInt selectedFuelType = 0.obs;
  RxInt selectedFuelTypeId = 0.obs;

  late GeoPoint currentPointPosition;

  RxInt selectedCar = 0.obs;
  RxInt selectedCarId = 0.obs;

  RxInt fuelQuantity = 0.obs;

  var isLoading = false.obs;
  List fuelDetail = [].obs;
  RxString selectedCity = "دمشق".obs;
  late RxInt selectedCityId = 1.obs;
  late RxInt selectedNeighborhoodId = 1.obs;
  Rx<String?> selectedNeighborhood = "المزة".obs;
  TextEditingController houseLocationDetailsController =
  TextEditingController();

  List<CustomerCars> myCars = [];
  final isUploading = false.obs;
  List<CityModel> cities = [];
  RxInt myCarsListLength=0.obs;

  List<NeighborhoodModel> neighborhoodes = [];
  static final String _baseUrl = APIConstants.baseUrl;

  // List<SearchInfo> items = [];
  @override
  void onInit() {
    getProperties();
    getFuelDetails();
    getCities();
    getCurrentLocation();

    getNeighborhood(cityId:1);

    super.onInit();
  }
  @override
  void onReady() {
    getProperties();
    getFuelDetails();
    getCities();
    getCurrentLocation();

    getNeighborhood(cityId:1);

    super.onReady();
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


  void setSelectedCar({required int value,required int selectedCarIndex}){
    selectedCar.value = value;
    selectedCarId.value=selectedCarIndex;
  }
  void setSelectedFuelType({required int value,required int selectedFuelTypeIndex}){
    selectedFuelType.value = value;
    selectedFuelTypeId.value=selectedFuelTypeIndex;

  }
  Future<void> getProperties() async {
    isUploading(true);
    print("getProperties");
    try {
      Map<String, dynamic> body =
      await THttpHelper.get(APIConstants.endPoints.getMyProperties);
      print(body);
      PropertiesModel propertiesModel = PropertiesModel.fromJson(body);

      myCars=propertiesModel.customerCars!;
      myCarsListLength.value=propertiesModel.customerCars!.length;
      selectedCarId.value=propertiesModel.customerCars![0].id!;
      //Get.back();
    } catch (e) {
      print(e);
    } finally {
      isUploading(false);
    }
  }
  Future<void> getFuelDetails() async {
    print("getFuelDetails");
    try {
      isLoading(true);
      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getFuelDetails}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'

          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> body = json.decode(response.body);
        fuelDetail.clear();
        for (int i = 0; i < body.length; i++) {
          fuelDetail.add(FuelDetailsModel(
            id: body[i]["id"],
            fuelTypeName: body[i]["fuelTypeName"],
            centerName: body[i]["centerName"],
            price: body[i]["price"],
          ));
        }
        selectedFuelTypeId.value=fuelDetail[0].id!;

      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
  Future<void> placeCarOrder() async {
    print("placeCarOrder");
    try {
      Map data ={
        "customerLat": latitude,
        "customerLong": longitude,
        "locationDescription": houseLocationDetailsController.text,
        "neighborhoodId": selectedNeighborhoodId.value,
        "cityId": selectedCityId.value,
        "fuelTypeId": selectedFuelTypeId.value,
        "orderedQuantity": fuelQuantity.value,
        "customerCarId": selectedCarId.value
      };
      print(data);
      Map<String, dynamic> body = await THttpHelper.post(
          endpoint: APIConstants.endPoints.placeCarOrder, data: data);
      print(body);
      THelperFunctions.showSnackBar(
          message: 'تم إرسال الطلب بنجاح', title: 'تعبئة وقود');
      //
    } catch (e) {
      print(e);
    }finally{
      HomeController controller = Get.put(HomeController());
      controller.onReady();
      Get.toNamed(Routes.HOME);
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
      cities.clear();
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
    print("getCurrentLocation");
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
