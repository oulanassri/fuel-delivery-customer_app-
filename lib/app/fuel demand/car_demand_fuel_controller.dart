//
// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// import '../../models/fuel_details.dart';
// import '../../models/properties.dart';
// import '../../models/search_info.dart';
// import '../../native_service/get_storage.dart';
// import '../../routes/app_routes.dart';
// import '../../utils/constants/api_constants.dart';
// import '../../utils/helpers/helper_functions.dart';
// import '../../utils/http/http_client.dart';
// import 'package:http/http.dart' as http;
//
// class CarFuelDemandController extends GetxController {
//   final String token = UserStorage.read('token');
//
//   RxInt selectedFuelType = 0.obs;
//
//   RxInt selectedCar = 0.obs;
//   RxInt fuelQuantity = 0.obs;
//   var isLoading = false.obs;
//   RxList fuelDetail = [].obs;
//
//
//   List<CustomerApartments> myApartments = [];
//   List<CustomerCars> myCars = [];
//   final isUploading = false.obs;
//
//
//   // List<SearchInfo> items = [];
//   @override
//   void onInit() {
//     getProperties();
//     getFuelDetails();
//     super.onInit();
//   }
//
//
//
//   void setSelectedCar(int value){
//     selectedCar.value = value;
//     update();
//   }
//
//   void setSelectedFuelType(int value){
//     selectedFuelType.value = value;
//     update();
//   }
//   Future<void> getProperties() async {
//     isUploading(true);
//     print("getProperties");
//     try {
//       Map<String, dynamic> body =
//       await THttpHelper.get(APIConstants.endPoints.getMyProperties);
//       print(body);
//       PropertiesModel propertiesModel = PropertiesModel.fromJson(body);
//
//       print(propertiesModel.customerCars?[0].plateNumber);
//       myApartments=propertiesModel.customerApartments!;
//       myCars=propertiesModel.customerCars!;
//       //Get.back();
//     } catch (e) {
//       print(e);
//     } finally {
//       isUploading(false);
//     }
//   }
//   Future<void> getFuelDetails() async {
//     print("getFuelDetails");
//     try {
//       isLoading(true);
//       final response = await http.get(
//           Uri.parse(
//               '${APIConstants.baseUrl}${APIConstants.endPoints.getFuelDetails}'),
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer $token'
//
//           });
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         List<dynamic> body = json.decode(response.body);
//
//         for (int i = 0; i < body.length; i++) {
//           fuelDetail.add(FuelDetailsModel(
//             id: body[i]["id"],
//             fuelTypeName: body[i]["fuelTypeName"],
//             centerName: body[i]["centerName"],
//             price: body[i]["price"],
//           ));
//         }
//         print(fuelDetail[0].name);
//       } else {
//         throw Exception('Failed to load date: ${response.statusCode}');
//       }
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading(false);
//     }
//   }
//   Future<void> placeHouseOrder() async {
//     print("placeHouseOrder");
//     try {
//       Map data ={
//         "customerLat": 0,
//         "customerLong": 0,
//         "locationDescription": "string",
//         "neighborhoodId": 0,
//         "cityId": 0,
//         "fuelTypeId": selectedFuelType.value,
//         "orderedQuantity": 0,
//         "customerCarId": 0
//       }{
//
//         "orderedQuantity":20, //fuelQuantity.value,
//         "customerApartmentId":selectedHouseId.value
//       } ;
//       print(data);
//       Map<String, dynamic> body = await THttpHelper.post(
//           endpoint: APIConstants.endPoints.placeCarOrder, data: data);
//       print(body);
//       THelperFunctions.showSnackBar(
//           message: 'تم إرسال الطلب بنجاح', title: 'تعبئة وقود');
//       //
//     } catch (e) {
//       print(e);
//     }finally{
//
//       Get.toNamed(Routes.HOME);
//     }
//   }
// /*void placeAutoComplete(String val) async {
//     await addressSugestion(val).then((value){
//       items=value;
//       print("items[0].geometry!.coordinates?[0] ${items[0].geometry!.coordinates?[0]}");
//       print("items[0].geometry!.coordinates?[1] ${items[0].geometry!.coordinates?[1]}");
//     });
//
//   }*/
// /* Future<List<SearchInfo>> addressSugestion(String address) async {
//
//     final json = THelperFunctions.suggestionAdress(address);
//
//     return (json/*["features"] */as List)
//         .map((e) => SearchInfo.fromJson(e))
//         .toList();
//   }*/
//
// }
