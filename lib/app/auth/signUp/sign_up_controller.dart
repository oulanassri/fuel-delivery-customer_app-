import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../native_service/get_storage.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constants/api_constants.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/http/http_client.dart';
import '../../home/home_controller.dart';

class SignUpController extends GetxController {
  static final String _baseUrl = APIConstants.baseUrl;
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
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // userName = '';
    //  email = '';
    //  mobileNumber = '';
    //  password = '';
    //  confirmPassword = '';

    // _addListener();
    // textFieldFocusNode.hasFocus = false;
    super.onInit();
  }

  Future<void> getCities() async {
    // isUploading(true);
    print("getCities");
    try {
      /*  final response = await Dio().get(
        '$_baseUrl${APIConstants.endPoints.getCities}',

          );*/

      /*   final response = await http.get(
          Uri.parse('$_baseUrl${APIConstants.endPoints.getCities}'),
          headers: {
            'Content-Type': 'application/json',
            "Access-Control-Allow-Origin": "*",
              "Access-Control-Allow-Methods": "GET",
          });*/

      final response = await http.get(
          Uri.parse('$_baseUrl${APIConstants.endPoints.getCities}'),
          headers: {
            'Content-Type': 'application/json',
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "GET",
          });
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {
        print(response.statusCode);
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<void> register() async {
    print("register");
    try {
      isLoading(true);

    Map data = {
        "name": userNameController.text,
        "password": passwordController.text,
        "phone": mobileNumberController.text,
        "email": emailController.text,
      };
      print(data);

      final response = await http.post(
          Uri.parse('$_baseUrl${APIConstants.endPoints.register}'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(data));

      if (response.statusCode == 200 || response.statusCode == 201) {
      final  body = json.decode(response.body);
        print(body["name"]);
        print(body["phone"]);
        print(body["email"]);
        UserStorage.save("name",body["name"]);
        UserStorage.save("phone",body["phone"]);
        UserStorage.save("email",body["email"]);


    login();
      //  Get.offNamed(Routes.HOME);
      } else if(response.statusCode == 409){ THelperFunctions.showSnackBar(
          message: 'المستخدم موجود مسبقا', title: 'رسالة خطأ');}else{
        THelperFunctions.showSnackBar(
            message: 'حدث خطأ ما يُرجى إعادة المحاولة', title: 'رسالة خطأ');
        print(response.body);
        throw Exception('Failed to load date: ${response.statusCode}');
      }
      //  storage.save("token", value);

    } catch (e) {
      print(e);
    }finally{
      isLoading(false);
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

  Future<void> login() async {
    print("login");
    try {
      Map data = {
        "password": passwordController.text,
        "phone": mobileNumberController.text,
      };
      print(data);

      Map<String, dynamic> body = await THttpHelper.postLogin(
          endpoint: APIConstants.endPoints.login, data: data);
      print(body["token"]);
      //  print(json.decode(body["token"] ));
      UserStorage.save("token", body["token"]);
      mobileNumberController.clear();
      passwordController.clear();
      HomeController controller = Get.put(HomeController());
      controller.onReady();
      THelperFunctions.showSnackBar(
          message: 'تمّ إنشاء الحساب بنجاح', title: 'أهلا بك بتطبيق FuelGo ');
      Get.offNamed(Routes.HOME);
    } catch (e) {
      THelperFunctions.showSnackBar(
          message: 'حدث خطأ ما يُرجى إعادة المحاولة', title: 'رسالة خطأ');

      print(e);
    }finally{
      isLoading(false);
    }
  }
}
