import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../models/order.dart';
import '../../native_service/get_storage.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/http/http_client.dart';

class OrdersController extends GetxController {
  static final String token = UserStorage.read('token');

  late UserStorage storage;
  var isLoading = false.obs;
  List<OrdersModel> orders = [];

  @override
  void onInit() {
    getMyOrders();
    super.onInit();
  }

  Future<void> getMyOrders() async {
    print("getMyOrders");
    try {
      isLoading(true);


      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getMyOrders}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> body = json.decode(response.body);

        for (int i = 0; i < body.length; i++) {
          orders.add(
            OrdersModel(
              date: body[i]["date"],
              orderNumber: body[i]["orderNumber"],
              locationDescription: body[i]["locationDescription"],
              neighborhoodName: body[i]["neighborhoodName"],
              fuelTypeName: body[i]["fuelTypeName"],
              orderedQuantity: body[i]["orderedQuantity"],
              price: body[i]["price"],
              finalQuantity: body[i]["finalQuantity"],
              finalPrice: body[i]["finalPrice"],
              customerCarBrand: body[i]["customerCarBrand"],
              customerApartmentName: body[i]["customerApartmentName"],
              authCode: body[i]["authCode"],
            ),
          );
        }
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
      //Get.back();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
