import 'package:delivery_fuel_customer/app/home/home_controller.dart';
import 'package:delivery_fuel_customer/app/profile/profile_controller.dart';
import 'package:delivery_fuel_customer/native_service/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/validators/validation.dart';
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
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: defaultPadding,
                  children: [
                    ProfileMenuWidget(
                      title: 'الاسم الكامل',
                      data: UserStorage.read("name")??"--",
                    ),


                    ProfileMenuWidget(
                      title: 'الهاتف',
                      data: UserStorage.read("phone")??"--",
                    ),
                    Text(
                      'البريد الإلكتروني:',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    Text(
                      UserStorage.read("email")??"--",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child:Obx(()=>controller.isLoading.value
                    ? MaterialButton(
                  onPressed: () {},
                  height: 50,
                  // margin: EdgeInsets.symmetric(horizontal: 50),
                  color: primaryButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  // decoration: BoxDecoration(
                  // ),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                )
                    :  CommonMaterialButton(
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

                          if (TValidator.isValidatePassword(
                              controller.newPassword.text) &&
                              (controller.newPassword.text ==
                                  controller.renewPassword.text)) {
                            controller.editPassword();
                          } else {
                            String? message1 = "", message2 = "";
                            if (!(TValidator.isValidatePassword(
                                controller.newPassword.text))) {
                              message1 = TValidator.validatePassword(
                                  controller.newPassword.text);
                            }
                            if (controller.newPassword.text !=
                                controller.renewPassword.text) {
                              message2 = "كلمتا السّر غير متطابقتان";
                            }
                            THelperFunctions.showSnackBar(
                                title: "رسالة خطأ",
                                message: "$message1 , $message2 ");
                          }
                        },
                        onCancel: () {
                          print("cancel");
                        });
                  },
                )),
              ),
            ],
          ),
        ));
  }
}
