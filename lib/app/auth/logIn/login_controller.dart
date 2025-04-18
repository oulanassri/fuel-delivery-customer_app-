import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../native_service/get_storage.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constants/api_constants.dart';
import '../../../utils/http/http_client.dart';
import '../../home/home_controller.dart';

class LoginController extends GetxController {
 // late UserStorage storage;
  var isPasswordHidden=true.obs;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
  //  storage = UserStorage();
    super.onInit();
  }

  Future<void> login() async {
    print("login");
    try {      isLoading(true);

    Map data = {
        "password": passwordController.text,
        "phone": phoneController.text,
      };
      print(data);
      Map<String, dynamic> body = await THttpHelper.postLogin(
          endpoint: APIConstants.endPoints.login, data: data);
      print(body["token"]);
      //  print(json.decode(body["token"] ));
      UserStorage.save("token", body["token"]);
      UserStorage.save("phone", phoneController.text);
      phoneController.clear();
      passwordController.clear();
    HomeController controller = Get.put(HomeController());
    controller.onReady();
      Get.offNamed(Routes.HOME);
    } catch (e) {
      print(e);
    }finally{
      isLoading(false);

    }
  }
}
