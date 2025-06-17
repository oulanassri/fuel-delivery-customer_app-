import 'package:delivery_fuel_customer/models/house.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../routes/app_routes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import '../properties/properties_controller.dart';
import 'components/fuel_type_card.dart';
import 'components/house_components/custom_house_sleek_slider.dart';
import 'components/house_components/house_card.dart';
import 'fuel_demand_controller.dart';

class HouseFuelDemandScreen extends GetView<FuelDemandController> {
  HouseFuelDemandScreen({Key? key}) : super(key: key);
  FuelDemandController controller = Get.find<FuelDemandController>();

  @override
  Widget build(BuildContext context) {
    controller.getFuelDetails();
    controller.getProperties();
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
                    ? Center(child: CircularProgressIndicator(color: primaryColor,))
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
                              "اختر المنزل",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Obx(() => controller.myApartmentsListLength.value == 0
                              ?Center(
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultPadding),
                                child: Column(
                                  children: [
                                    Text(
                                      "لا يوجد منازل مضافة ،يُرجى إضافة منزل إلى الممتلكات بصفحة الممتلكات",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                    TextButton(
                                      onPressed: () { PropertiesController controller = Get.put(PropertiesController());

                                      controller.getProperties();
                                      Get.toNamed(Routes.PROPERTIES);}, child: Text(
                                      "الذّهاب إلى صفحة الممتلكات",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium?.copyWith( decoration: TextDecoration.underline),
                                    ),)
                                  ],
                                )),
                          )
                              : Container(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  child: ListView.builder(
                                      itemCount: controller.myApartments.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Obx(
                                          () => GestureDetector(
                                            onTap: () {
                                              controller.setSelectedHouse(
                                                  value: index,
                                                  selectedHouseIndex: controller
                                                          .myApartments[index]
                                                          .id ??
                                                      0);
                                            },
                                            child: HouseCard(
                                              house: controller
                                                  .myApartments[index],
                                              chosen: controller.selectedHouse
                                                          .value ==
                                                      index
                                                  ? true
                                                  : false,
                                            ),
                                          ),
                                        );
                                      }),
                                )),
                          Padding(
                            padding: EdgeInsets.only(right: defaultPadding),
                            child: Text(
                              "أدخل كميّة التّعبئة",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          CustomHouseSleekSlider(
                            controller: controller,
                          ),
                          /*  Padding(
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
                          ),*/
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 100),
                              child: MaterialButton(
                                onPressed: () {

                                  if (
                                      controller.selectedHouseId.value != 0) {
                                    controller.placeHouseOrder();
                                  }else{
                                    String message1="";

                                    if(controller.selectedHouseId.value == 0) {
                                      message1="يُرجى يُرجى إضافة منزل إلى الممتلكات ليكتمل الطلب";
                                    }
                                    THelperFunctions.showSnackBar(
                                        message: '$message1 ', title: 'رسالة خطأ');
                                  }
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
              )),
        ),
      ),
    );
  }
}
