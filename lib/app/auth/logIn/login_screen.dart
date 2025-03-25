import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/maki_icons.dart';

import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../constants.dart';
import '../components/custom_material_button.dart';
import '../components/custom_text_form_field.dart';
import 'login_controller.dart';

class LogInScreen extends GetView<LoginController> {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    RxBool obscureText = true.obs;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(gradient: gradientColorBg),
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
                          "تسجيل دخول",
                          style: Theme.of(context).textTheme.headlineMedium,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeInUp(
                        duration: Duration(milliseconds: 1300),
                        child: Text(
                          "أهلا بعودتك",
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
                                  hintText: "رقم الهاتف",
                                  controller: controller.phoneController,
                                ),

                                Obx(() => Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200),
                                        ),
                                      ),
                                      child: TextField(
                                        obscureText: obscureText.value,
                                        controller:
                                            controller.passwordController,
                                        decoration: InputDecoration(
                                            suffix: InkWell(
                                              child: Icon(
                                                obscureText.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                              onTap: () {
                                                obscureText.value =
                                                    !(obscureText.value);
                                                print(obscureText.value);
                                              },
                                            ),
                                            label: Text("أدخل كلمة السّر"),
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                            hintText: "كلمة السّر",
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
                          duration: Duration(milliseconds: 1500),
                          child: Text(
                            "هل نسيت كلمة السّر",
                            style: TextStyle(color: Colors.grey),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1600),
                        child: Obx(()=>controller.isLoading.value
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
                          text: "تسجيل دخول",
                          buttonColor: secondaryColor,
                          textColor: white,
                          function: () {
                            controller.login();
                          },
                        ),)
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1600),
                        child: CustomMaterialButton(
                          route: Routes.SIGNUP,
                          text: "إنشاء حساب",
                          buttonColor: white,
                          textColor: secondaryColor,
                          function: () {
                            Get.toNamed(Routes.SIGNUP);
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

  void onClickLogin() async {
    // EasyLoading.show(status: 'Loading....', dismissOnTap: true);

    /*bool loginSuccess = await controller.userLogin(
      email: controller.email,
      password: controller.password,
      phoneNumber: controller.mobileNumber,
    );
*/
    // EasyLoading.dismiss(); // Dismiss the loading indicator

    /* if (loginSuccess) {

      /*buttonAudio("song_assets/tada.mp3");
      Get.lazyPut(() => SuccessController());
      Get.bottomSheet(
        const SuccessBottomSheet(),
        backgroundColor: Themes.backGroundDialogColor,
      );*/
    }/* else if(controller.statusCode==403){
     controller.storage.save('email',controller.email);
       Get.offAllNamed(Routes.AUTHENTICATED);

    }*/else {

   /*   buttonAudio("song_assets/error1.mp3");
      Get.defaultDialog(
        backgroundColor:
        Themes.backGroundDialogColor,
        title: '',
        content: const FulsDialog(),
      );
      print("*********** Error here ************");
    }*/
  }*/
  }
}
