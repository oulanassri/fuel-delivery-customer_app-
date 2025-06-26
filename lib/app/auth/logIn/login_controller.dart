import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/profile_model.dart';
import '../../../native_service/get_storage.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constants/api_constants.dart';
import '../../../utils/http/http_client.dart';
import '../../home/home_controller.dart';

class LoginController extends GetxController {
  // late UserStorage storage;
  var isPasswordHidden = true.obs;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  static late final String token;

  @override
  void onInit() {
    //  storage = UserStorage();
    super.onInit();
  }

  Future<void> login() async {
    print("login");
    try {
      isLoading(true);

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
      //UserStorage.save("phone", phoneController.text);
      token = UserStorage.read('token');
      phoneController.clear();
      passwordController.clear();
      getProfile();
      HomeController controller = Get.put(HomeController());
      controller.onReady();
      Get.offNamed(Routes.HOME);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getProfile() async {
    print("getProfile");
    try {
      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getProfile}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> body = json.decode(response.body);
        ProfileModel profileModel = ProfileModel.fromJson(body);

        print(profileModel.phone);
        print(profileModel.email);
        print(profileModel.name);
        UserStorage.save("phone", profileModel.phone ?? "");
        UserStorage.save("email", profileModel.email ?? "");
        UserStorage.save("name", profileModel.name ?? "");

        //  print("ordersListLength ${ordersListLength.toString()}");
        isLoading(false);
      } else {
        print(response.body);
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {}
  }
}
