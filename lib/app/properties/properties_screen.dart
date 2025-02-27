import 'package:delivery_fuel_customer/models/car.dart';
import 'package:delivery_fuel_customer/models/house.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../auth/components/custom_text_form_field.dart';
import '../common/custom_app_bar.dart';
import '../common/custom_material_button.dart';
import '../common/custom_text_form_field1.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import '../properties/properties_controller.dart';
import 'components/car_property_card.dart';
import 'components/house_property_card.dart';

class PropertiesScreen extends GetView<PropertiesController> {
  const PropertiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PropertiesController());

    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: CustomAppBar(
        title: "الممتلكات",
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: gradientColorBg,
          ),
          child: Column(
            spacing: defaultPadding,
            children: [
              SizedBox(
                height: defaultPadding,
              ),
              Text(
                "لا يوجد ممتلكات",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: MaterialButton(
                      onPressed: () {
                        Get.defaultDialog(
                            cancelTextColor: secondaryButton,
                            buttonColor: secondaryButton,
                            title: "إضافة سيّارة",
                            textConfirm: "إضافة",
                            textCancel: "إلغاء",
                            titleStyle: Theme.of(context).textTheme.titleMedium,
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  CustomTextFormField1(
                                    hintText: 'رقم لوحة السيّارة',
                                    controller:
                                        controller.plateNumberController,
                                  ),
                                  CustomTextFormField1(
                                    hintText: 'نوع السيّارة',
                                    controller: controller.brandController,
                                  ),
                                  CustomTextFormField1(
                                    hintText: 'لون السيّارة',
                                    controller: controller.colorController,
                                  ),
                                  CustomTextFormField1(
                                    hintText: 'سنة الصّنع',
                                    controller:
                                        controller.yearOfManufactureController,
                                  ),
                                ],
                              ),
                            ),
                            onConfirm: () {
                              controller.addCar();
                              print("confirm");
                            },
                            onCancel: () {
                              print("cancel");
                            });
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
                          "إضافة سيّارة",
                          style: TextStyle(
                              color: secondaryText,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: defaultPadding,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: MaterialButton(
                      onPressed: () {
                        Get.defaultDialog(
                            cancelTextColor: secondaryButton,
                            buttonColor: secondaryButton,
                            title: "إضافة منزل",
                            textConfirm: "إضافة",
                            textCancel: "إلغاء",
                            titleStyle: Theme.of(context).textTheme.labelMedium,
                            content: Column(
                              children: [
                                CustomTextFormField1(
                                  hintText: 'House Location on Map',
                                  controller: controller.plateNumberController,
                                ),
                                CustomTextFormField1(
                                  hintText: 'House Location Details',
                                  controller:
                                      controller.houseLocationDetailsController,
                                ),
                                CustomTextFormField1(
                                  hintText: 'House City',
                                  controller: controller.houseCityController,
                                ),
                                CustomTextFormField1(
                                  hintText: 'House Neighborhood',
                                  controller:
                                      controller.houseNeighborhoodController,
                                ),
                              ],
                            ),
                            onConfirm: () {
                              print("confirm");
                            },
                            onCancel: () {
                              print("cancel");
                            });
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
                          "إضافة منزل",
                          style: TextStyle(
                              color: secondaryText,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.myCars.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CarPropertyCard(
                      car: Car(
                        type: controller.myCars[index].brand ?? "",
                        color: controller.myCars[index].color ?? "",
                        yearOfManufacture: controller.myCars[index].model ?? "",
                        plateNumber: controller.myCars[index].plateNumber ?? "",
                      ),
                    );
                  }),
              CarPropertyCard(
                car: Car(
                    type: "Kia",
                    color: "grey",
                    yearOfManufacture: "2020",
                    plateNumber: "223344"),
              ),
              HousePropertyCard(
                house: House(location: """المدينة. الحيّ. تفاصيل عن الموقع"""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
