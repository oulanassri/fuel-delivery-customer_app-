import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../native_service/get_storage.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/api_services/api_services.dart';
import '../../../utils/constants/api_constants.dart';
import '../../../utils/http/http_client.dart';

class SignUpController extends GetxController {
  final getStorage = GetStorage();
  late UserStorage storage;
  int? statusCode = 0;

  //vars of screen
  final userNameController = TextEditingController();

  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final signupFormKey = GlobalKey<FormState>();

  RxBool isPasswordHidden = true.obs;
  RxBool isPasswordConfirmHidden = true.obs;

  //vars of api call
  late String userName;
  late String email;
  late String mobileNumber;
  late String password;
  late String confirmPassword;

  //vars of api response
  String message = '';
  bool signUpStatus = false;
  bool isLoading = false;

  @override
  void onInit() {
    // userName = '';
    //  email = '';
    //  mobileNumber = '';
    //  password = '';
    //  confirmPassword = '';

    storage = UserStorage();
    // _addListener();
    // textFieldFocusNode.hasFocus = false;
    super.onInit();
  }

  Future<void> register() async {
    print("register");
    try {
      Map data = {
        "name": userNameController.text,
        "password": passwordController.text,
        "phone": mobileNumberController.text,
        "email": emailController.text,
      };
      print(data);
      Map<String, dynamic> body = await THttpHelper.post(
          endpoint: APIConstants.endPoints.register, data: data);
      print(body);
      //  storage.save("token", value);
      userNameController.clear();
      passwordController.clear();
      mobileNumberController.clear();
      emailController.clear();
      Get.offNamed(Routes.HOME);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    userNameController.dispose();
    emailController.dispose();
    mobileNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }
}
