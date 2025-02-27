
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/search_info.dart';
import '../../native_service/get_storage.dart';
import '../../utils/helpers/helper_functions.dart';

class FuelDemandController extends GetxController {
  late UserStorage storage;
  RxInt selectedFuelType = 0.obs;

  RxInt selectedCar = 0.obs;


  RxInt selectedHouse = 0.obs;


  List<SearchInfo> items = [];
  @override
  void onInit() {
    storage = UserStorage();

    super.onInit();
  }



  void setSelectedCar(int value){
    selectedCar.value = value;
    update();
  }
  void setSelectedHouse(int value){
    selectedHouse.value = value;
    update();
  }
  void setSelectedFuelType(int value){
    selectedFuelType.value = value;
    update();
  }
  void placeAutoComplete(String val) async {
    await addressSugestion(val).then((value){
      items=value;
      print("items[0].geometry!.coordinates?[0] ${items[0].geometry!.coordinates?[0]}");
      print("items[0].geometry!.coordinates?[1] ${items[0].geometry!.coordinates?[1]}");
    });

  }
  Future<List<SearchInfo>> addressSugestion(String address) async {

    final json = THelperFunctions.suggestionAdress(address);

    return (json/*["features"] */as List)
        .map((e) => SearchInfo.fromJson(e))
        .toList();
  }

}
