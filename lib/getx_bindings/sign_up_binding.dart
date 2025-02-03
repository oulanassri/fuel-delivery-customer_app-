

import 'package:get/get.dart';

import '../app/auth/SignUp/sign_up_controller.dart';


class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SignUpController());
  }

}