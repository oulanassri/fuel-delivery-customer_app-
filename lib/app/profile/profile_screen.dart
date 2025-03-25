import 'package:delivery_fuel_customer/app/home/home_controller.dart';
import 'package:delivery_fuel_customer/app/profile/profile_controller.dart';
import 'package:delivery_fuel_customer/native_service/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../common/common_material_button.dart';
import '../common/custom_app_bar.dart';
import '../common/custom_text_form_field1.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import 'components/profile_menu_widget.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return Scaffold(
        drawer: CustomNavigationDrawer(),
        appBar: CustomAppBar(
          title: "الملف الشّخصي",
        ),
        body: Container(
          decoration: BoxDecoration(gradient: gradientColorBg),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                // margin: EdgeInsets.symmetric(horizontal: defaultPadding * 3 / 4),
                margin: EdgeInsets.all(defaultPadding),
                padding: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 5),
                  borderRadius: BorderRadius.circular(15),
                  gradient: gradientColorBg,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: defaultPadding,
                  children: [
                    ProfileMenuWidget(
                      title: 'الاسم الكامل',
                      data: UserStorage.read("name")??"--",
                    ),
                    ProfileMenuWidget(
                      title: 'البريد الإلكتروني',
                      data: UserStorage.read("email")??"--",
                    ),
                    ProfileMenuWidget(
                      title: 'الهاتف',
                      data: UserStorage.read("phone")??"--",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: CommonMaterialButton(
                  title: 'تغيير كلمة السّر',
                  function: () {
                    Get.defaultDialog(
                        cancelTextColor: secondaryButton,
                        buttonColor: secondaryButton,
                        title: "تغيير كلمة السّر",
                        textConfirm: "تغيير",
                        textCancel: "إلغاء",
                        titleStyle: Theme.of(context).textTheme.labelMedium,
                        content: Column(
                          children: [
                            CustomTextFormField1(
                              hintText: 'كلمة السّر القديمة',
                              controller: controller.oldPassword,
                            ),
                            CustomTextFormField1(
                              hintText: 'كلمة السّر الجديدة',
                              controller: controller.newPassword,
                            ),
                            CustomTextFormField1(
                              hintText: 'كلمة السّر الجديدة مرة أخرى',
                              controller: controller.renewPassword,
                            ),
                          ],
                        ),
                        onConfirm: () {
                          print("confirm");

                          controller.editPassword();
                        },
                        onCancel: () {
                          print("cancel");
                        });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
