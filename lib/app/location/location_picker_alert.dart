//
// import 'package:delivery_fuel_customer/app/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
//
// class LocationPickerAlert extends StatefulWidget {
//   final Function(LatLng)? onLocationSelected;
//
//   const LocationPickerAlert({Key? key, this.onLocationSelected})
//       : super(key: key);
//
//   @override
//   State<LocationPickerAlert> createState() => _LocationPickerAlertState();
// }
//
// class _LocationPickerAlertState extends State<LocationPickerAlert> {
//   GoogleMapController? mapController;
//   LatLng? _selectedLocation;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _requestLocationPermission();
//   }
//
//   void _requestLocationPermission() async {
//     LocationPermission permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       print("Location Permission denied");
//     } else if (permission == LocationPermission.deniedForever) {
//       print("Location Permission Denied Forever");
//     } else {
//       _getCurrentLocation();
//     }
//   }
//
//   void _getCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       print('Latitude ${position.latitude}, Longitude ${position.longitude}');
//       setState(() {
//         _selectedLocation = LatLng(position.latitude, position.longitude);
//       });
//     } catch (e) {
//       print("Error getting current location: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: SizedBox(
//         width: double.maxFinite,
//         height: MediaQuery.of(context).size.height * 0.8,
//         child: Column(
//           children: [
//             Expanded(
//               child: GoogleMap(
//                 mapType: MapType.terrain,
//                 onMapCreated: (controller) {
//                   mapController = controller;
//                 },
//                 onTap: (latLng) {
//                   setState(() {
//                     _selectedLocation = latLng;
//                   });
//                 },
//                 markers: _selectedLocation != null
//                     ? {
//                         Marker(
//                           markerId: MarkerId('selectedLocation'),
//                           position: _selectedLocation!,
//                           infoWindow: InfoWindow(
//                               title: 'Selected Location',
//                               snippet:
//                                   'Lat ${_selectedLocation!.latitude}, Lng: ${_selectedLocation!.longitude}'),
//                         )
//                       }
//                     : {},
//                 initialCameraPosition:
//                     CameraPosition(target: LatLng(0, 0), zoom: 10),
//                 myLocationEnabled: true,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(bottom: 10, top: 5),
//               child: FloatingActionButton(
//                 backgroundColor: primaryColor,
//                 onPressed: () async {
//                   if (_selectedLocation != null) {
//                     print(
//                         "Selected Location - Lat: ${_selectedLocation!.latitude}, Lng:${_selectedLocation!.longitude}");
//                     Navigator.pop(context);
//                     widget.onLocationSelected?.call(_selectedLocation!);
//                   } else {}
//                 },
//                 child: Icon(
//                   Icons.check,
//                   color: white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
