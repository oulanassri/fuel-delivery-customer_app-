import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../app/settings/settings_controller.dart';

class SettingsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SettingsController());
  }

}