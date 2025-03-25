import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../native_service/get_storage.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() async {

    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      checkToken();
    });
  }

//maybe for delete
  Future<void> checkToken() async {
    String? token = UserStorage.read('token');
    print('Here is the token at spalsh $token');
    if (token.isNotEmpty) {
      Get.offAndToNamed(Routes.HOME);
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }
}
