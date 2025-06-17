import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'helper_functions.dart';

class NetworkController extends GetxController {
  int connectionType = 0;
  final RxString connectstatus=''.obs;
  final Connectivity connectivity = Connectivity();
late StreamSubscription _streamSubscription;
  @override
  void onInit() {
   // GetConnectionType();
    //_streamSubscription=_
    connectivity.onConnectivityChanged.listen(updateConnectionStatus);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
  }
void updateConnectionStatus(List<ConnectivityResult>connectivityResultList){
    if(connectivityResultList.contains(ConnectivityResult.mobile)){
      print("Mobile Internet");
      connectstatus.value="Mobile Internet";
    }
    else if(connectivityResultList.contains(ConnectivityResult.vpn)){
      print("VPN");
      connectstatus.value="VPN";
    }
    else if(connectivityResultList.contains(ConnectivityResult.none)){
      print("offline");
      connectstatus.value="offline";
    }
    else if(connectivityResultList.contains(ConnectivityResult.other)){
      print("other");
      connectstatus.value="other";
    }else{
      connectstatus.value="Something Was Wrong";

    }
}
 /*Future<void> GetConnectionType() async{
    var connectiveResult;
    try {
      connectiveResult=await (_connectivity.checkConnectivity());

    } on PlatformException catch (e) {
      print(e);
    }
    return _updateState(connectiveResult);
  }
  _updateState(ConnectivityResult result){
    switch(result){
      case ConnectivityResult.wifi:
        connectionType=1;
        update();
        break;
      case ConnectivityResult.mobile:
        connectionType=2;
        update();
        break;
      case ConnectivityResult.none:
        connectionType=0;
        update();
        break;
      default:THelperFunctions.showSnackBar(
          message: 'حدث خطأ بالاتصال يرجى إعادة المحاولة عند توفر الانترنت', title: 'حالة الإنترنت');
    }
  }*/
}
