import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../native_service/get_storage.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/http/http_client.dart';
import 'package:http/http.dart' as http;

class WalletController extends GetxController {
  RxString wallet = '0'.obs;
  RxBool isLoading = false.obs;
  RxString otpCode = ''.obs;

  @override
  void onInit() {
    getMyWallet();
    print("onInit WalletController");
    super.onInit();
  }

  Future<void> getMyWallet() async {
    print("getMyWallet");
    try {
      isLoading(true);

      String body =
          await THttpHelper.getString(APIConstants.endPoints.getMyWallet);
      wallet.value = body;

      print(body);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
  Future<void> requestOTP() async {
    print("requestOTP");

    try {
      final response = await http.patch(
        Uri.parse(
            '${APIConstants.baseUrl}${APIConstants.endPoints.requestOTP}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${UserStorage.read('token')}'
        },
      );
      print("requestOTP response.statusCode  ${response.statusCode}");
      print("requestOTP response.body  ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        otpCode.value=response.body;
        THelperFunctions.showSnackBar(message: 'تم طلب رمز المصادقة', title: 'رمز المصادقة');

      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

}
