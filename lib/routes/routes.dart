import 'package:get/get.dart';
import 'package:wrl_home_quarantine_getx/logic/bindings/home_binding.dart';
import 'package:wrl_home_quarantine_getx/logic/bindings/login_binding.dart';
import 'package:wrl_home_quarantine_getx/logic/bindings/test_binding.dart';
import 'package:wrl_home_quarantine_getx/logic/bindings/wifi_binding.dart';
import 'package:wrl_home_quarantine_getx/views/screens/auth/login_view.dart';
import 'package:wrl_home_quarantine_getx/views/screens/home_view.dart';
import 'package:wrl_home_quarantine_getx/views/screens/test_view.dart';
import 'package:wrl_home_quarantine_getx/views/screens/wifi_view.dart';





class
AppRoutes {
static const login = Routes.login;
static const home = Routes.home;
static const wifi = Routes.wifi;
static const cell = Routes.cell;
static const test = Routes.test;

  static final routes = [
    GetPage(name: Routes.login, page: () =>  const LoginView(),binding: LoginBinding()),
    GetPage(name: Routes.home, page: () =>  const HomeView(),binding: HomeBinding()),
    GetPage(name: Routes.wifi, page: () =>  const WifiView(),binding: WifiBinding()),
    GetPage(name: Routes.test, page: () =>  const TestView(),binding: TestBinding(),preventDuplicates: false,),
  ];

}
class Routes {

  static const login = '/login';
  static const home = '/home';
  static const wifi = '/wifi';
  static const cell = '/cell';
  static const test = '/test';
}
