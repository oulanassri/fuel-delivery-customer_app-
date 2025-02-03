import 'package:get/get.dart';

import '../app/auth/Splash/splash_controller.dart';


class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }

}