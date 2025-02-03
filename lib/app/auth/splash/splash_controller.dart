import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../native_service/get_storage.dart';
import '../../../routes/app_routes.dart';


class SplashController extends GetxController {
  late UserStorage storage;

  @override
  void onInit() async {
    storage = UserStorage();

    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Get.offAllNamed(
        Routes.LOGIN,
      );
    });
  }

//maybe for delete
  Future<void> checkToken() async {
    String? token = await storage.read('token');
    print('Here is the token at spalsh $token');
    if (token != null) {
    } else {}
  }
}
