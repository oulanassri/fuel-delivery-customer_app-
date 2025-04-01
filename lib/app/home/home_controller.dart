import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:web_socket_channel/io.dart';
import '../../models/properties.dart';
import '../../models/truck_order_model.dart';
import '../../native_service/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants/api_constants.dart';
import '../../utils/http/http_client.dart';

class HomeController extends GetxController {
  Position? currentLocation;
  var locationMessage = "";
  var isLoading = false.obs;
  List<CustomerCars> myCars = [];
  List<CustomerApartments> myApartments = [];
  Position? currentPosition;
  String? currentAddress;
  late TruckOrderModel truckOrderModel;//قيد الانتظار
  RxString orderStatus = "".obs; // InProgress //home وصل للموقع5 قيد الانتظار  في الطريق4  بدء تعبئة الطلب6
  RxInt orderStatusId = 10.obs;
 // StreamController streamController = StreamController();
/*  final channel = IOWebSocketChannel.connect(
      Uri.parse("http://172.201.110.216:5000")); */
  /////http://172.201.110.216:5000
  @override
  void onInit() {
   // trackOrder();
   // streamListener();

    super.onInit();
    Timer.periodic(Duration(seconds: 3), (timer){
      getTruckOrder();
    });
  }

  @override
  void onReady() {
   // streamController.close();
  //  streamController = StreamController();
    Timer.periodic(Duration(seconds: 3), (timer){
      getTruckOrder();
    });
    super.onReady();
  }
  @override
  void onClose() {
   // streamController.close();
    super.onClose();
  }

 /* streamListener() {
    channel.stream.listen((message) {
      print(message);
    });
  }*/



  /* void _getPlace() async {
    List<Placemark> newPlace = await Geolocator().placemarkFromCoordinates(_position.latitude, _position.longitude);

    // this is all you need
    Placemark placeMark  = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String country = placeMark.country;
    String address = "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";

    print(address);

    setState(() {
      _address = address; // update _address
    });
  }*/
/*
  void getPosition() async {
    print("getPosition");
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }   if (permission == LocationPermission.deniedForever) {
      print(
          'Location permissions are permanetly denied,we cannot request permissions.');
    }/*else {
      print("Location not available");
    }*/
    currentPosition= await Geolocator.getCurrentPosition();
    getAddress(currentPosition?.latitude,
        currentPosition?.longitude);
  }
// Get autocomplete predictions
  final predictions = await placesAutocomplete('Times Square');
  predictions.forEach((prediction) {
  print(prediction.description);
  });
  Future<void> getAddress(latitude,longitude ) async {
    try { print("getAddress");
      List<Placemark>? placeMark = await GeocodingPlatform.instance
          ?.placemarkFromCoordinates(latitude,longitude );
      Placemark? place=placeMark?[0];
      currentAddress="${place?.locality}  ${place?.street}  ${place?.country}";
      print(currentAddress);
    } catch (e) {
      print(e);
    }
  }*/
  Future<void> getTruckOrder() async {
   try{ final response = await http.get(
     Uri.parse(
         '${APIConstants.baseUrl}${APIConstants.endPoints.trackOrder}'),
     headers: {
       'Content-Type': 'application/json',
       'Authorization': 'Bearer ${UserStorage.read('token')}'
     },
   );
   if (response.statusCode == 200 || response.statusCode == 201) {
     final temp = json.decode(response.body);
     print(temp);
     TruckOrderModel truckOrderModel=new TruckOrderModel(status: temp["status"]);
     //  streamController.sink.add(truckOrderModel);

     orderStatus.value = truckOrderModel.status!;
     if(orderStatus.value=="قيد الانتظار") {
       orderStatusId.value = 0;
     }  else if(orderStatus.value=="في الطريق") {
       orderStatusId.value = 1;
     } else if(orderStatus.value=="بدء تعبئة الطلب") {
       orderStatusId.value = 3;
     }else if(orderStatus.value=="وصل للموقع") {
       orderStatusId.value = 2;
     }
     else{
       orderStatusId.value = 4;

     }
   } else {
     orderStatusId.value = 10;

     throw Exception('Failed to load date: ${response.statusCode}');
   }
   }catch(e){
     orderStatusId.value = 10;

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
          'Location permissions are permanetly denied,we cannot request permissions.');
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
    print("latitude");
    print(currentPosition?.latitude);
    print("longitude");
    print(currentPosition?.longitude);
  }

  Future<void> openMap(String lat, String long) async {
    print("https://www.google.com/maps/search/?api=1&query=$lat,$long");
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    await canLaunchUrlString(googleUrl)
        ? await launchUrlString(googleUrl)
        : throw 'Could not launch $googleUrl';
  }

 /* Future<void> trackOrder() async {
    print("trackOrder");

    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(
            '${APIConstants.baseUrl}${APIConstants.endPoints.trackOrder}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${UserStorage.read('token')}'
        },
      );
      print("response.statusCode trackOrder  ${response.statusCode}");
      print("response.statusCode trackOrder ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var temp = json.decode(response.body);
        truckOrderModel = TruckOrderModel(status: temp["status"].toString(),
            estimatedDeliveryTime: temp["estimatedDeliveryTime"].toString());
        orderStatus.value = truckOrderModel.status!;
        //  Get.back();
        // getProperties();
        //THelperFunctions.showSnackBar(message: 'تم طلب رمز المصادقة', title: 'رمز المصادقة');
        isLoading(false);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }*/

  Future<void> getProperties() async {
    print("getProperties");
    try {
      isLoading(true);
      Map<String, dynamic> body =
      await THttpHelper.get(APIConstants.endPoints.getMyProperties);
      print(body);
      PropertiesModel propertiesModel = PropertiesModel.fromJson(body);

      print(propertiesModel.customerCars?[0].plateNumber);
      myCars = propertiesModel.customerCars!;
      myApartments = propertiesModel.customerApartments!;
      //Get.back();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
/*
  void determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    print('1');
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print('2');
    if (!serviceEnabled) {
      print('Location permissions are denied');
    }
    permission = await Geolocator.checkPermission();
    print('3');
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print(
          'Location permissions are permanetly denied,we cannot request permissions.');
    }
    print("Geolocator.getCurrentPosition.toString()");
    currentLocation = await Geolocator.getCurrentPosition();
    print(currentLocation?.longitude.toString());
    placeMarks = await placemarkFromCoordinates(
        currentLocation?.latitude ?? 37.4219,
        currentLocation?.longitude ?? -122.084);
    // print(placeMarks?[0].country!);

   // print(placemarks[0].country!);
  }*/
}
