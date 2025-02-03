import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../native_service/get_storage.dart';

class OrdersController extends GetxController {
  late UserStorage storage;

  @override
  void onInit() {
    storage = UserStorage();
    super.onInit();
  }

}