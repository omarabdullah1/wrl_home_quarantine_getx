import 'package:get/get.dart';
import 'package:wrl_home_quarantine_getx/logic/controllers/wifi_controller.dart';

class WifiBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WifiController());
  }

}