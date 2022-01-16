// ignore_for_file: file_names
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:get/get.dart';
import 'package:wrl_home_quarantine_getx/routes/routes.dart';
import 'Shared/network/local/cache_helper.dart';
import 'logic/controllers/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool token = CacheHelper.getData(key: 'token');
  bool done = CacheHelper.getData(key: 'done');

  // bool isWifi = CacheHelper.getData(key: 'wifi');
  // Widget widget;
  // if (isWifi != null) {
  //   if (isWifi) {
  //     widget = BluetoothApp();
  //   }
  // }
  // startWidget: widget
  // runApp(ExampleApp());
  runApp(
    WithForegroundTask(
      child: GetMaterialApp(
        title: "login",
        initialRoute: token == null
            ? AppRoutes.wifi //login
            : token
                ? done
                    ? AppRoutes.test
                    : AppRoutes.wifi
                : AppRoutes.wifi, //login
        getPages: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
          brightness: Brightness.light,
        ),
      ),
    ),
  );
}

// class ExampleApp extends StatelessWidget {
//   //
//   // final Widget startWidget;
//   // final AppController appController = Get.put(AppController());
//   //  ExampleApp({Key key, this.startWidget,}) : super(key: key);
//   // void initState() {
//   //   appController.getInitForeground();
//   //   appController.getStartForeground();
//   //   const sec = Duration(seconds: 1);
//   //   Timer(
//   //       sec,
//   //           () => print(appController.counter));
//   // }
//   //
//   // void dispose() {
//   //   appController.receivePort?.close();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//             debugShowCheckedModeBanner: false,
//             // home: WithForegroundTask(
//             //     child: WIFIScanner(),
//             //   ),
//
//           );
//   }
//   }
// widget.startWidget
