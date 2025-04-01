import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/city.dart';
import '../../models/neighborhood.dart';
import '../common/custom_app_bar.dart';
import '../common/custom_text_form_field1.dart';
import '../constants.dart';
import 'adding_house_controller.dart';

class AddingHouseScreen extends StatelessWidget {
  var controller = Get.put(AddingHouseController());

  @override
  Widget build(BuildContext context) {
    controller.getCities();
    return Scaffold(
      appBar: CustomAppBar(
        title: "إضافة منزل",
      ),
      body:  SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(defaultPadding),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: gradientColorBg,
                  ),
                  child:Obx(
                        () => controller.isLoading.value
                        ? Container(
                      decoration: BoxDecoration(
                        gradient: gradientColorBg,
                      ),
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      ),
                    )
                        : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "اختر  المحافظة",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            DropdownButton<String>(
                                // updated
                                onChanged: (String? newValue) {
                                  controller.setSelectedCity(newValue ?? '');
                                },
                                value: controller.selectedCity.value,
                                onTap: () {}, //updated
                                items: [
                                  for (CityModel value in controller.cities)
                                    DropdownMenuItem(
                                      value: value.name,
                                      child: Text(
                                        value.name ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge, //updated
                                      ),
                                    ),
                                ]),
                          ],
                        ),
                      ),
                      Obx(
                        () => controller.selectedCityId > 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "اختر الحيّ",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  DropdownButton(
                                      // updated
                                      onChanged: (String? newValue) {
                                        controller.setSelectedNeighborhood(
                                            newValue ?? '');
                                      },
                                      value:
                                          controller.selectedNeighborhood.value,
                                      onTap: () {}, //updated
                                      items: [
                                        for (NeighborhoodModel value
                                            in controller.neighborhoodes)
                                          DropdownMenuItem(
                                            value: value.name,
                                            child: Text(
                                              value.name ?? "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge, //updated
                                            ),
                                          ),
                                      ]),
                                ],
                              )
                            : Container(),
                      ),
                      Text(
                        "يُرجى إدخال تفاصيل العنوان بالكامل",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      CustomTextFormField1(
                        hintText: "العنوان بالكامل",
                        controller: controller.houseLocationDetailsController,
                      ),
                      Text(
                        "يُرجى تحديد موقعك على الخريطة",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            var geoPoint = await showSimplePickerLocation(
                                context: context,
                                isDismissible: true,
                                title: "pick address",
                                textConfirmPicker: "pick",
                                initPosition: controller.currentPointPosition,
                                /*GeoPoint(
                  latitude: currentPosition!.latitude,
                  longitude: currentPosition!.longitude),*/
                                /* initCurrentUserPosition: UserTrackingOption(
                enableTracking: true,
              ),*/
                                radius: 0,
                                zoomOption:
                                    ZoomOption(stepZoom: 10, initZoom: 18));
                            if (geoPoint != null) {
                              controller.longitude = geoPoint.longitude;
                              controller.latitude = geoPoint.latitude;

                              /* Fluttertoast.showToast(
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.SNACKBAR,
                msg: 'Click to ${geoPoint.toString()}');*/
                            }
                          },
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.pin_drop,
                              color: primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: MaterialButton(
                          onPressed: () {
                            // Get.toNamed(Routes.ADDINGHOUSESCREEN);
                            controller.addApartment();
                          },
                          height: 50,
                          // margin: EdgeInsets.symmetric(horizontal: 50),
                          color: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          // decoration: BoxDecoration(
                          // ),
                          child: Center(
                            child: Text(
                              "إضافة المنزل",
                              style: TextStyle(
                                  color: secondaryText,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      /* Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: (String value) async {

                        controller.isLoading.value = true;
                        var data = await addressSuggestion(textController.text);
                        if (data.isNotEmpty) {
                          controller.listSource.value = data;
                        }
                        controller.isLoading.value = false;

                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      // setState(() async {
                      controller.isLoading.value = true;
                      var data = await addressSuggestion(textController.text);
                      if (data.isNotEmpty) {
                        controller.listSource.value = data;
                      }
                      controller.isLoading.value = false;
                      //  });
                    },
                    icon: Icon(Icons.search,color: primaryColor,),
                  ),
                ],
              ),
            ),
            Obx(() => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: controller.listSource.isEmpty
                        ? Container()
                        : ListView.builder(
                            itemCount: controller.listSource.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  controller.currentPointPosition =
                                      controller.listSource[index].point!;
                                  textController.text=controller.listSource[index].address.toString();
                                 controller.currentPointPosition=controller.listSource[index].point!;
                                  print("currentPointPosition");
                                  print(controller.currentPointPosition);
                                  controller.listSource.clear();
                                  /* Fluttertoast.showToast(
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR,
                          msg:
                          'Click to ${controller.listSource[index].point.toString()}');*/
                                  controller.currentPointPosition =
                                      controller.listSource[index].point!;
                                },
                                title: Text(controller.listSource[index].address
                                    .toString()),
                              );
                            }),
                  )),
*/
                      /*  GestureDetector(
                      onTap: () {
                        // getCurrentLocation();
                      },
                      child: Text("Get the current location"),
                    ),*/
                      //  Text("show in google map"),
                    ],
                  ),),
                ),
              ),

      /*floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var geoPoint = await showSimplePickerLocation(
              context: context,
              isDismissible: true,
              title: "pick address",
              textConfirmPicker: "pick",
              initPosition: controller.currentPointPosition,
              /*GeoPoint(
                  latitude: currentPosition!.latitude,
                  longitude: currentPosition!.longitude),*/
              /* initCurrentUserPosition: UserTrackingOption(
                enableTracking: true,
              ),*/
              radius: 0,
              zoomOption: ZoomOption(stepZoom: 10, initZoom: 18));
          if (geoPoint != null) {
            controller.longitude = geoPoint.longitude;
            controller.latitude = geoPoint.latitude;

            /* Fluttertoast.showToast(
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.SNACKBAR,
                msg: 'Click to ${geoPoint.toString()}');*/
          }
        },
        child: Icon(Icons.pin_drop),
      ),*/
    );
  }
}
