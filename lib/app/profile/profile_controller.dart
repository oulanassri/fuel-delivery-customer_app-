import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/http/http_client.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  late UserStorage storage;
  static final String token = UserStorage.read('token');

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController renewPassword = TextEditingController();
  @override
  void onInit() {
    storage = UserStorage();
    super.onInit();
  }
  Future<void> editPassword() async {
    Get.back();
    print("editPassword");
    try {
      Map data ={
        "oldPassword": oldPassword.text,
        "password": newPassword.text,
        "rePassword":  renewPassword.text
      };
      print(data);


      final response = await http.put(Uri.parse('${APIConstants.baseUrl}${APIConstants.endPoints.editPassword}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: json.encode(data));
      print("response statusCode  ${response.statusCode}");
      print("response body  ${response.body}");
      if (response.statusCode == 200 ) {
        THelperFunctions.showSnackBar(
            message: 'تم تغيير كلمة السّر بنجاح', title: 'تغيير كلمة السّر');
        oldPassword.clear();
        newPassword.clear();
        renewPassword.clear();

      } else {
        THelperFunctions.showSnackBar(
            message: response.body, title: 'تغيير كلمة السّر');
        throw Exception('Failed to load date: ${response.statusCode}');
      }



    } catch (e) {
      print(e);
    }finally{

    }
  }

}