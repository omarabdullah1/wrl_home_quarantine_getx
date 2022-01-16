// // ignore_for_file: Avoid_print
// import 'dart:isolate';
// import 'package:blue/blue.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
// import 'package:flutter_foreground_task/flutter_foreground_task.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:wifi_iot/wifi_iot.dart';
//
// class AppController extends GetxController {
//
//   FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
//   BluetoothState bluetoothState = BluetoothState.UNKNOWN;
//   BluetoothConnection connection;
//   BluetoothManager bluetoothManager = BluetoothManager.instance;
//   var counter=0.obs;
//   bool connectedBT = false;
//   bool blueOpenState = false;
//   bool isDisconnecting = false;
//   bool isButtonUnavailable = false;
//   List<WifiNetwork> wifiNetwork = [];
//   List devicesList = [];
//
//   Future<List> getDeviceItems() async {
//     var items = [];
//     for (var device in devicesList) {
//       items.add(device);
//     }
//     return items;
//   }
//   getWifi() async {
//     await loadWifiList().then((value) {
//       wifiNetwork =value;
//       counterIncrease();
//       print(counter);
//     }).catchError((onError){
//       print(onError);
//     });
//     for(var device in wifiNetwork){
//       print(device.ssid);
//       print(device.bssid);
//       print(device.level.toString());
//     }
//   }
//   void counterIncrease(){
//     counter++;
//   }
//   Future<void> initPlatformState() async {
//     Blue.getMethodChannel.setMethodCallHandler((call) {
//       if (call.method == "blueOnOff") {
//         blueOpenState = call.arguments;
//         // emit(BluetoothONState());
//       }
//       return;
//     });
//   }
//
//   void openBlue(bool onOff) async {
//     await Blue.blueOnOff(onOff);
//     bool blueOpenState = await Blue.getBlueIsEnabled;
//     print("Bluetooth switch callback:  $blueOpenState");
//     blueOpenState = blueOpenState;
//     // emit(BluetoothONState());
//   }
//
//   // Request Bluetooth permission from the user
//   Future<void> enableBluetooth() async {
//     // Retrieving the current Bluetooth state
//     bluetoothState = await FlutterBluetoothSerial.instance.state;
//
//     // If the bluetooth is off, then turn it on first
//     // and then retrieve the devices that are paired.
//     if (bluetoothState == BluetoothState.STATE_OFF) {
//       await FlutterBluetoothSerial.instance.requestEnable();
//       await getPairedDevices();
//       return true;
//     } else {
//       await getPairedDevices();
//     }
//     return false;
//   }
//
//   Future<void> getPairedDevices() async {
//     var devices = [];
//
//     // To get the list of paired devices
//     try {
//       devices = await bluetooth.getBondedDevices();
//     } on PlatformException {
//       print("Error");
//     }
//     devicesList = devices;
//     // emit(BluetoothGetDeviceListState());
//   }
//
// /*
// Foreground Tasks Section
// The callback function should always be a top-level function.
// */
//
//   void startCallback() {
//     // The setTaskHandler function must be called to handle the task in the background.
//     FlutterForegroundTask.setTaskHandler(FirstTaskHandler());
//   }
//
//   void updateCallback() {
//     FlutterForegroundTask.setTaskHandler(FirstTaskHandler());
//   }
//
//   Future<void> onDestroy(DateTime timestamp) async {}
//
//   ReceivePort receivePort;
//
//   Future<void> _initForegroundTask() async {
//     await FlutterForegroundTask.init(
//       androidNotificationOptions: const AndroidNotificationOptions(
//         channelId: 'notification_channel_id',
//         channelName: 'Foreground Notification',
//         channelDescription:
//         'This notification appears when the foreground service is running.',
//         channelImportance: NotificationChannelImportance.LOW,
//         priority: NotificationPriority.LOW,
//         iconData: NotificationIconData(
//           resType: ResourceType.mipmap,
//           resPrefix: ResourcePrefix.ic,
//           name: 'launcher',
//         ),
//       ),
//       iosNotificationOptions: const IOSNotificationOptions(
//         showNotification: true,
//         playSound: false,
//       ),
//       foregroundTaskOptions: const ForegroundTaskOptions(
//         interval: 100,
//         autoRunOnBoot: true,
//         allowWifiLock: true,
//       ),
//       printDevLog: true,
//     );
//   }
//
//   Future<bool> _startForegroundTask() async {
//     // You can save data using the saveData function.
//     await FlutterForegroundTask.saveData(key: 'customData', value: 'hello');
//
//     ReceivePort receivePort;
//     if (await FlutterForegroundTask.isRunningService) {
//       receivePort = await FlutterForegroundTask.restartService();
//     } else {
//       receivePort = await FlutterForegroundTask.startService(
//         notificationTitle: 'Home Quarantine is running',
//         notificationText: 'Tap to return to the app',
//         callback: startCallback,
//       );
//     }
//
//     if (receivePort != null) {
//       receivePort = receivePort;
//       receivePort?.listen((message) {
//         if (message is DateTime) {
//           // print('receive timestamp: $message');
//         } else if (message is int) {
//           // print('receive updateCount: $message');
//         }
//       });
//
//       return true;
//     }
//
//     return false;
//   }
//
//   void getInitForeground() => _initForegroundTask();
//
//   void getStartForeground() => _startForegroundTask();
//
//   void getDevices() => getDeviceItems();
//
//   Future<List<APClient>> getClientList(
//       bool onlyReachables, int reachableTimeout) async {
//     List<APClient> htResultClient;
//     try {
//       htResultClient =
//       await WiFiForIoTPlugin.getClientList(onlyReachables, reachableTimeout);
//     } on PlatformException {
//       htResultClient = <APClient>[];
//     }
//
//     return htResultClient;
//   }
//
//   Future<List<WifiNetwork>> loadWifiList() async {
//     List<WifiNetwork> htResultNetwork;
//     try {
//       htResultNetwork = await WiFiForIoTPlugin.loadWifiList();
//     } on PlatformException {
//       htResultNetwork = <WifiNetwork>[];
//     }
//     return htResultNetwork;
//   }
//
// }
//
// class FirstTaskHandler implements TaskHandler {
//   @override
//   Future<void> onStart(DateTime timestamp, SendPort sendPort) async {
//     // You can use the getData function to get the data you saved.
//     // final customData =
//     // await FlutterForegroundTask.getData<String>(key: 'customData');
//     // print('customData: $customData');
//   }
//
//   @override
//   Future<void> onEvent(DateTime timestamp, SendPort sendPort) async {
//     // print(timestamp.toString());
//     FlutterForegroundTask.updateService(
//       notificationTitle: 'HomeQuarantine Task',
//     );
//     // notificationText: timestamp.toString(),
//     // callback: updateCount >= 10 ? updateCallback : null);
//
//     // Send data to the main isolate.
//     // sendPort?.send(timestamp);
//     // sendPort?.send(updateCount);
//
//     // updateCount++;
//   }
//
//   @override
//   Future<void> onDestroy(DateTime timestamp) async {
//     // You can use the clearAllData function to clear all the stored data.
//     await FlutterForegroundTask.removeData(key: 'customData');
//   }
// }
