import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:delivery_fuel_customer/app/auth/SignUp/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../routes/app_routes.dart';
import '../../constants.dart';
import '../components/custom_material_button.dart';
import '../components/custom_text_form_field.dart';


class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            primaryColor,
            Colors.grey,
            primaryColor,
          ]),
        ),
        child: SingleChildScrollView(child: Column(
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
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                      duration: Duration(milliseconds: 1300),
                      child: Text(
                        "Welcome",
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              CustomTextFormField(
                                hintText: "Enter your name",
                                controller: controller.userNameController,
                              ),
                              CustomTextFormField(
                                hintText: "Enter your lastname",
                                controller: controller.lastUserNameController,
                              ),
                              CustomTextFormField(
                                hintText: "Enter your email",
                                controller: controller.emailController,
                              ),CustomTextFormField(
                                hintText: "Enter your phone",
                                controller: controller.mobileNumberController,
                              ),
                              CustomTextFormField(
                                hintText: "Password",
                                controller: controller.passwordController,
                              ),
                              CustomTextFormField(
                                hintText: "Re-enter Password",
                                controller: controller.confirmPasswordController,
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 40,
                    ),

                    FadeInUp(
                      duration: Duration(milliseconds: 1600),
                      child: CustomMaterialButton(
                        route: Routes.HOME,
                        text: "Sign Up",
                        buttonColor: primaryColor,
                        textColor: white,
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),),
      ),
    );
  }


  void onClickRegister() async {
    /*EasyLoading.show(status: 'Loading....', dismissOnTap: true);

    bool registerSuccess = await controller.userRegister(
        name: controller.userName,
        email: controller.email,
        password: controller.password,
        passwordConfirmation: controller.confirmPassword,
        phoneNumber: controller.mobileNumber,
        imagePathing: controller.imagePathing,
        imageName: controller.imageName,
        filePath: controller.filePathing,
        fileName: controller.fileName
    );

    EasyLoading.dismiss(); // Dismiss the loading indicator

    if (registerSuccess) {
      controller.storage.save('email',controller.email);
      print('saved email is user storage');
      print(controller.storage.read('email'));
      buttonAudio("song_assets/bubble.mp3");


       Get.offAllNamed(Routes.AUTHENTICATED);


      EasyLoading.dismiss(); // Dismiss the loading indicator
    } else {
    //  EasyLoading.showError('Error', duration: const Duration(seconds: 3), dismissOnTap: true);
        Get.dialog(const WrongMessageDialog());
      print("*********** Error here ************");
    }*/
  }
}
