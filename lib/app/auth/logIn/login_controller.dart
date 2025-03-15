import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../native_service/get_storage.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constants/api_constants.dart';
import '../../../utils/http/http_client.dart';

class LoginController extends GetxController {
 // late UserStorage storage;
  var isPasswordHidden=true.obs;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
  //  storage = UserStorage();
    super.onInit();
  }

  Future<void> login() async {
    print("login");
    try {
      Map data = {
        "password": passwordController.text,
        "phone": phoneController.text,
      };
      print(data);
      Map<String, dynamic> body = await THttpHelper.post(
          endpoint: APIConstants.endPoints.login, data: data);
      print(body["token"]);
      //  print(json.decode(body["token"] ));
      UserStorage.save("token", body["token"]);
      UserStorage.save("phone", phoneController.text);
      phoneController.clear();
      passwordController.clear();

      Get.offNamed(Routes.HOME);
    } catch (e) {
      print(e);
    }
  }
}
