import 'package:get/get.dart';

import '../app/auth/LogIn/login_controller.dart';


class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
  }

}