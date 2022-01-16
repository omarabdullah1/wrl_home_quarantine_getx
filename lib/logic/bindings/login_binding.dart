import 'package:get/get.dart';
import 'package:wrl_home_quarantine_getx/logic/controllers/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}