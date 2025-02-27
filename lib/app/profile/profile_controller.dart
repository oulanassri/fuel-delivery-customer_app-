import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../native_service/get_storage.dart';

class ProfileController extends GetxController {
  late UserStorage storage;
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController renewPassword = TextEditingController();
  @override
  void onInit() {
    storage = UserStorage();
    super.onInit();
  }

}