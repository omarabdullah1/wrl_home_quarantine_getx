import 'package:get/get.dart';
import 'package:wrl_home_quarantine_getx/logic/controllers/test_controller.dart';


class TestBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TestController());
  }

}