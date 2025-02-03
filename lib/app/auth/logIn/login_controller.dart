import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../native_service/get_storage.dart';

class LoginController extends GetxController {
  late UserStorage storage;
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void onInit() {

    storage = UserStorage();
    super.onInit();
  }



/*
  Future<bool> userLogin({
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    print('User Login:');
    print('Email: $email');
    print('Password: $password');
    print('Phone Number: $phoneNumber');

    try {
      dynamic response = await DioHelper.postData(url: 'api/auth/login', data: {
        'email': email,
        'password': password,
        'phone_number': phoneNumber,
      });

      print('Response:');
      print(response.data);

      LoginResponseModel logInResponseModel =
          LoginResponseModel.fromJson(response.data);
      print("Status Code ");
      print('${logInResponseModel.status}');
print('access_token ');
print('${logInResponseModel.accessToken}');
      print("refresh_token");
      print('${logInResponseModel.refreshToken}');

storage.save('access_token', '${logInResponseModel.accessToken}');
      storage.save('refresh_token','${logInResponseModel.refreshToken}');

      print('Message: ${logInResponseModel.message}');
      return true; // Indicate success
    } catch (error) {
      if (error is DioException) {
        print('DioException occurred:');
        print(error.message);

        if (error.response != null) {
          print('Response data:');
          print(error.response?.data);
          print('Status code:');
          print(error.response?.statusCode);
          statusCode = error.response?.statusCode!;
        }
      } else {
        print('An unexpected error occurred:');
        print(error);
      }
      return false; // Indicate failure
    }
  }


*/


}
