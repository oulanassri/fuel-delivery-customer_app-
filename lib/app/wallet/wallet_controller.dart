import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../native_service/get_storage.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/http/http_client.dart';

class WalletController extends GetxController {
  late UserStorage storage;
 RxString wallet='0'.obs;
  @override
  void onInit() {
    storage = UserStorage();
    getMyWallet();
    print("onInit WalletController");
    super.onInit();
  }
  Future<void> getMyWallet() async {
    print("getMyWallet");
    try {
      String body =
      await THttpHelper.getString(APIConstants.endPoints.getMyWallet);
      wallet.value=body;

   print(body);

    } catch (e) {
      print(e);
    }
  }
}