import 'package:delivery_fuel_customer/models/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../models/city.dart';
import '../../models/fuel_type.dart';
import '../../models/neighborhood.dart';
import '../common/custom_text_form_field1.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import 'car_demand_fuel_controller.dart';
import 'components/car_components/car_card.dart';
import 'components/car_components/custom_car_sleek_slider.dart';
import 'components/fuel_type_card.dart';

class CarFuelDemandScreen extends StatelessWidget {
   CarFuelDemandScreen({Key? key}) : super(key: key);
  CarFuelDemandController controller=Get.find<CarFuelDemandController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: gradientColorBg),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: CustomNavigationDrawer(),
        appBar: AppBar(
          title: Text(
            "تعبئة وقود",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(),
            child: Obx(
              () => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Column(
                        spacing: defaultPadding,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: defaultPadding),
                            child: Text(
                              "اختر نوع الوقود",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 8,
                            child: ListView.builder(
                                itemCount: controller.fuelDetail.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        controller.setSelectedFuelType(
                                            value: index,
                                            selectedFuelTypeIndex: controller
                                                    .fuelDetail[index].id ??
                                                0);
                                      },
                                      child: FuelTypeCard(
                                        fuelType: controller.fuelDetail[index],
                                        chosen:
                                            controller.selectedFuelType.value ==
                                                    index
                                                ? true
                                                : false,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: defaultPadding),
                            child: Text(
                              "اختر السيّارة",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),//myCarsListLength
                         Obx(()=>controller.myCarsListLength.value==0?Center(
                           child: Text(
                             "لا يوجد سيّارات ، أضف سيارة إلى الممتلكات",
                             style: Theme.of(context).textTheme.headlineMedium,
                           ),
                         ) :Container(
                           height: MediaQuery.of(context).size.height / 4,
                           child: ListView.builder(
                               itemCount: controller.myCars.length,
                               scrollDirection: Axis.horizontal,
                               itemBuilder: (context, index) {
                                 return Obx(
                                       () => GestureDetector(
                                     onTap: () {
                                       controller.setSelectedCar(
                                           value: index,
                                           selectedCarIndex:
                                           controller.myCars[index].id ??
                                               0);
                                     },
                                     child: CarCard(
                                       car: controller.myCars[index],
                                       chosen: controller.selectedCar.value ==
                                           index
                                           ? true
                                           : false,
                                     ),
                                   ),
                                 );
                               }),
                         ),),
                          Padding(
                            padding: EdgeInsets.only(right: defaultPadding),
                            child: Text(
                              "أدخل كميّة التّعبئة",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          CustomCarSleekSlider(controller: controller,),
                          Padding(
                            padding: EdgeInsets.only(right: defaultPadding),
                            child: Text(
                              "كلفة الخدمة 2\$",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: defaultPadding),
                            child: Text(
                              "كلفة الخدمة الاجماليّة 80\$",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
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
                                      controller
                                          .setSelectedCity(newValue ?? '');
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "اختر الحيّ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      DropdownButton(
                                          // updated
                                          onChanged: (String? newValue) {
                                            controller.setSelectedNeighborhood(
                                                newValue ?? '');
                                          },
                                          value: controller
                                              .selectedNeighborhood.value,
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
                            controller:
                                controller.houseLocationDetailsController,
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
                                    initPosition:
                                        controller.currentPointPosition,
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
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 100),
                              child: MaterialButton(
                                onPressed: () {
                                  controller.placeCarOrder();
                                 /* Get.defaultDialog(
                                      title: "جار البحث",
                                      titleStyle: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      content: Text(
                                        " عن شاحنة بالقرب منك",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ));*/
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
                                    "تعبئة وقود",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: defaultPadding * 2,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
