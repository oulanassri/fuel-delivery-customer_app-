import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:delivery_fuel_customer/app/auth/SignUp/sign_up_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/http/http_client.dart';
import '../../../utils/validators/validation.dart';
import '../../constants.dart';
import '../components/custom_material_button.dart';
import '../components/custom_text_form_field.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool obscurePassword = true.obs;
    RxBool obscureHiddenPassword = true.obs;

    Get.put(SignUpController());
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: gradientColorBg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(
                        duration: Duration(milliseconds: 1000),
                        child: Text(
                          "إنشاء حساب",
                          style: Theme
                              .of(context)
                              .textTheme
                              .headlineMedium,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeInUp(
                        duration: Duration(milliseconds: 1300),
                        child: Text(
                          "أهلا بك",
                          style: Theme
                              .of(context)
                              .textTheme
                              .headlineSmall,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      FadeInUp(
                          duration: Duration(milliseconds: 1400),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFFA3A3A3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                CustomTextFormField(
                                  hintText: "الاسم بالكامل",
                                  controller: controller.userNameController,
                                ),
                                CustomTextFormField(
                                  hintText: "البريد الإلكتروني",
                                  controller: controller.emailController,
                                ),
                                CustomTextFormField(
                                  hintText: "رقم الهاتف",
                                  controller: controller.mobileNumberController,
                                ),
                                Obx(() =>
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200),
                                        ),
                                      ),
                                      child: TextField(
                                        obscureText: obscurePassword.value,
                                        controller:
                                        controller.passwordController,
                                        decoration: InputDecoration(
                                            suffix: InkWell(
                                              child: Icon(
                                                obscurePassword.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                              onTap: () {
                                                obscurePassword.value =
                                                !(obscurePassword.value);
                                              },
                                            ),
                                            label: Text("أدخل كلمة السّر"),
                                            labelStyle: Theme
                                                .of(context)
                                                .textTheme
                                                .titleMedium,
                                            hintText: "كلمة السّر",
                                            hintStyle:
                                            TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    )),
                                Obx(() =>
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200),
                                        ),
                                      ),
                                      child: TextField(
                                        obscureText:
                                        obscureHiddenPassword.value,
                                        controller: controller
                                            .confirmPasswordController,
                                        decoration: InputDecoration(
                                            suffix: InkWell(
                                              child: Icon(
                                                obscureHiddenPassword.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                              onTap: () {
                                                obscureHiddenPassword.value =
                                                !(obscureHiddenPassword
                                                    .value);
                                              },
                                            ),
                                            label:
                                            Text("أدخل كلمة السّر للتحقّق"),
                                            labelStyle: Theme
                                                .of(context)
                                                .textTheme
                                                .titleMedium,
                                            hintText: "كلمة السّر للتحقّق",
                                            hintStyle:
                                            TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    )),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      FadeInUp(
                          duration: Duration(milliseconds: 1600),
                          child: Obx(() =>
                          controller.isLoading.value
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
                              : CustomMaterialButton(
                            route: Routes.HOME,
                            text: "إنشاء الحساب",
                            buttonColor: secondaryColor,
                            textColor: white,
                            function: () {
                              if (TValidator.isValidateName(
                                  controller
                                      .userNameController.text) &&
                                  TValidator.isValidatePhoneNumber(
                                      controller
                                          .mobileNumberController
                                          .text) &&
                                  TValidator.isValidateEmail(
                                      controller
                                          .emailController
                                          .text) &&
                                  TValidator.isValidatePassword(
                                      controller.passwordController.text) &&
                                  (controller.passwordController.text ==
                                      controller.confirmPasswordController
                                          .text)) {
                                controller.register();
                              } else {
                                String? message1 = "",
                                    message2 = "",
                                    message3 = "",
                                    message4 = "",
                                    message5 = "";

                                if (!(TValidator.isValidateName(
                                    controller.userNameController
                                        .text))) {
                                  message1 =
                                      TValidator.validateName(
                                          controller
                                              .userNameController
                                              .text);
                                }
                                if (!(TValidator
                                    .isValidatePhoneNumber(
                                    controller
                                        .mobileNumberController
                                        .text))) {
                                  message2 = TValidator
                                      .validatePhoneNumber(
                                      controller
                                          .mobileNumberController
                                          .text);
                                }
                                if (!(TValidator
                                    .isValidateEmail(
                                    controller
                                        .emailController
                                        .text))) {
                                  message3 = TValidator
                                      .validateEmail(
                                      controller
                                          .emailController
                                          .text);
                                }
                                if (!(TValidator
                                    .isValidatePassword(
                                    controller
                                        .passwordController
                                        .text))) {
                                  message4 = TValidator
                                      .validatePassword(
                                      controller
                                          .passwordController
                                          .text);
                                }
                                if (controller.passwordController.text !=
                                    controller.confirmPasswordController.text) {
                                  message5 = "كلمتا السّر غير متطابقتان";
                                }
                                THelperFunctions.showSnackBar(
                                    title: "رسالة خطأ",
                                    message:
                                    "$message1 , $message2 , $message3 , $message4, $message5");
                              }
                            },
                          ),)
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
