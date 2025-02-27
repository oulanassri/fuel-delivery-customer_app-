import 'package:community_material_icon/community_material_icon.dart';
import 'package:delivery_fuel_customer/models/house.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../models/fuel_type.dart';
import '../common/custom_material_button.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import 'components/custom_fuel_quantity_field.dart';
import 'components/drop_down_button.dart';
import 'components/fuel_type_card.dart';
import 'components/fuel_type_button.dart';
import 'components/house_components/custom_house_sleek_slider.dart';
import 'components/house_components/house_card.dart';
import 'fuel_demand_controller.dart';

class HouseFuelDemandScreen extends GetView<FuelDemandController> {
  const HouseFuelDemandScreen({Key? key}) : super(key: key);

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
                      itemCount: fuelTypeList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Obx(
                              () => GestureDetector(
                            onTap: () {
                              controller.setSelectedFuelType(index);
                            },
                            child: FuelTypeCard(
                              fuelType: fuelTypeList[index],
                              chosen: controller.selectedFuelType.value == index
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
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: ListView.builder(
                      itemCount: housesList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Obx(
                              () => GestureDetector(
                            onTap: () {
                              controller.setSelectedHouse(index);
                            },
                            child: HouseCard(
                              house: housesList[index],
                              chosen: controller.selectedHouse.value == index
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
                CustomHouseSleekSlider(),
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
                            titleStyle: Theme.of(context).textTheme.titleLarge,
                            content: Text(
                              " عن شاحنة بالقرب منك",
                              style: Theme.of(context).textTheme.titleLarge,
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
                          style: Theme.of(context).textTheme.headlineSmall,
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
    );
  }
}
