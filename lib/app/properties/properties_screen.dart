import 'package:delivery_fuel_customer/models/car.dart';
import 'package:delivery_fuel_customer/models/house.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../models/properties.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../auth/components/custom_text_form_field.dart';
import '../common/custom_app_bar.dart';
import '../common/custom_material_button.dart';
import '../common/custom_text_form_field1.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import '../properties/properties_controller.dart';
import 'components/car_property_card.dart';
import 'components/house_property_card.dart';

class PropertiesScreen extends StatelessWidget {
  PropertiesScreen({Key? key}) : super(key: key);
  PropertiesController controller = Get.find<PropertiesController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: CustomAppBar(
        title: "الممتلكات",
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        //height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradientColorBg,
        ),
        child: Obx(() => controller.isLoading.value
            ? Container(
                decoration: BoxDecoration(
                  gradient: gradientColorBg,
                ),
                height: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  spacing: defaultPadding,
                  children: [
                    SizedBox(
                      height: defaultPadding,
                    ),
                    /* Text(
                "لا يوجد ممتلكات",
                style: Theme.of(context).textTheme.titleMedium,
              ),*/
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
                                  titleStyle:
                                      Theme.of(context).textTheme.titleMedium,
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
                                          controller:
                                              controller.brandController,
                                        ),
                                        CustomTextFormField1(
                                          hintText: 'لون السيّارة',
                                          controller:
                                              controller.colorController,
                                        ),
                                        CustomTextFormField1(
                                          hintText: 'سنة الصّنع',
                                          controller: controller
                                              .yearOfManufactureController,
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
                              Get.offAndToNamed(Routes.ADDINGHOUSESCREEN);
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
                    controller.myCars.isNotEmpty?
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.myCars.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onLongPress: () {
                              Get.defaultDialog(
                                  cancelTextColor: secondaryButton,
                                  buttonColor: secondaryButton,
                                  title: "حذف سيّارة",
                                  textConfirm: "حذف",
                                  textCancel: "إلغاء",
                                  titleStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                  content: Text(
                                    "هل تريد حذف السيّارة",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  onConfirm: () {
                                    controller.deleteCar(
                                        plateNumber: controller
                                            .myCars[index].plateNumber
                                            .toString());
                                    print("confirm");
                                  },
                                  onCancel: () {
                                    print("cancel");
                                  });
                            },
                            child: CarPropertyCard(
                              car: CustomerCars(
                                id: controller.myCars[index].id,
                                color: controller.myCars[index].color ?? "",
                                model: controller.myCars[index].model ?? "",
                                plateNumber:
                                    controller.myCars[index].plateNumber ?? "",
                                brand: controller.myCars[index].brand ?? "",
                                phone: controller.myCars[index].phone ?? "",
                              ),
                            ),
                          );
                        }):Container(),
                    controller.myApartments.isNotEmpty?

                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.myApartments.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onLongPress: () {
                              Get.defaultDialog(
                                  cancelTextColor: secondaryButton,
                                  buttonColor: secondaryButton,
                                  title: "حذف منزل",
                                  textConfirm: "حذف",
                                  textCancel: "إلغاء",
                                  titleStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                  content: Text(
                                    "هل تريد حذف المنزل",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  onConfirm: () {
                                    controller.deleteApartment(
                                        id: controller.myApartments[index].id ??
                                            0);
                                    /* controller.deleteCar(
                                        plateNumber: controller
                                            .myCars[index].plateNumber
                                            .toString());*/
                                    print("confirm");
                                  },
                                  onCancel: () {
                                    print("cancel");
                                  });
                            },
                            child: HousePropertyCard(
                              apartments: controller.myApartments[index],
                            ),
                          );
                        }):Container(),
                    SizedBox(
                      height: defaultPadding / 2,
                    ),
                  ],
                ),
              )),
      ),
    );
  }
}
