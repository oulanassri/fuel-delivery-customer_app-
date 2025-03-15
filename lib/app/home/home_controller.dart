import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../native_service/get_storage.dart';

class HomeController extends GetxController {
  late UserStorage storage;
  Position? currentLocation;
  var locationMessage = "";

  Position? currentPosition;
  String? currentAddress;

  @override
  void onInit() {
    storage = UserStorage();
    super.onInit();
  }

  RxString orderStatus = "InProgress".obs; // InProgress //home

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
