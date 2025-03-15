import 'package:delivery_fuel_customer/models/car.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../models/fuel_type.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import 'components/car_components/car_card.dart';
import 'components/car_components/custom_car_sleek_slider.dart';
import 'components/fuel_type_card.dart';
import 'fuel_demand_controller.dart';

class CarFuelDemandScreen extends GetView<FuelDemandController> {
  const CarFuelDemandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FuelDemandController());

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
            child: Obx(() => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : Column(
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
                                    controller.setSelectedFuelType(index);
                                  },
                                  child: FuelTypeCard(
                                    fuelType: controller.fuelDetail[index],
                                    chosen: controller.selectedFuelType.value ==
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
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        child: ListView.builder(
                            itemCount: controller.myCars.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    controller.setSelectedCar(index);
                                  },
                                  child: CarCard(
                                    car:controller.myCars[index],
                                    chosen:
                                        controller.selectedCar.value == index
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
                          "أدخل كميّة التّعبئة",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      CustomCarSleekSlider(),
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
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 100),
                          child: MaterialButton(
                            onPressed: () {
                              Get.defaultDialog(
                                  title: "جار البحث",
                                  titleStyle:
                                      Theme.of(context).textTheme.titleLarge,
                                  content: Text(
                                    " عن شاحنة بالقرب منك",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ));
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
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding * 2,
                      ),
                    ],
                  )),
          ),
        ),
      ),
    );
  }
}
