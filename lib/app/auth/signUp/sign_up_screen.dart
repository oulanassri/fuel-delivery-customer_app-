import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:delivery_fuel_customer/app/auth/SignUp/sign_up_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/api_services/api_services.dart';
import '../../../utils/http/http_client.dart';
import '../../constants.dart';
import '../components/custom_material_button.dart';
import '../components/custom_text_form_field.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          style: Theme.of(context).textTheme.headlineMedium,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeInUp(
                        duration: Duration(milliseconds: 1300),
                        child: Text(
                          "أهلا بك",
                          style: Theme.of(context).textTheme.headlineSmall,
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
                                CustomTextFormField(
                                  hintText: "كلمة السّر",
                                  controller: controller.passwordController,
                                ),
                                CustomTextFormField(
                                  hintText: "كلمة السّر للتحقّق",
                                  controller:
                                      controller.confirmPasswordController,
                                ),
                              ],
                            ),
                          )),
                      /* SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        child: Text(
                          "إنشاء حساب",
                          style: TextStyle(color: Colors.purple),
                        ),
                        onTap: () async{
                          //  DioHelper d=DioHelper();
                          //  d.init();
                    //    await  controller.onRegister();
                        },
                      ),*/
                      SizedBox(
                        height: 40,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1600),
                        child: CustomMaterialButton(
                          route: Routes.HOME,
                          text: "إنشاء الحساب",
                          buttonColor: secondaryColor,
                          textColor: white,
                          function: () {
                            print("fun");
                            controller.register();
                          },
                        ),
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
