// // ignore_for_file: avoid_print, deprecated_member_use, duplicate_ignore
// import 'dart:async';
// import 'dart:isolate';
//
// import 'package:flutter/services.dart';
// import 'package:flutter_foreground_task/flutter_foreground_task.dart';
// import 'package:flutter_gsmcelllocation/flutter_gsmcelllocation.dart';
// import 'package:get/get.dart';
// import 'package:wifi_iot/wifi_iot.dart';
//
// class AppController extends GetxController {
//   // FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
//   // BluetoothState bluetoothState = BluetoothState.UNKNOWN;
//   // BluetoothConnection connection;
//   // BluetoothManager bluetoothManager = BluetoothManager.instance;
//   var counter = 0.obs;
//   // List devicesList = [];
//
//   // bool connectedBT = false.obs as bool;
//   // bool blueOpenState = false.obs as bool;
//   // bool isDisconnecting = false.obs as bool;
//   bool isButtonUnavailable = false;
//   // List<WifiNetwork> wifiNetwork = [];
//   Map platformVersion = {'cid': 11111111}.obs;
//   Capture myCapture = Capture();
//   List<WifiNetwork> wifiNetwork = [];
//   List devicesList = [];

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
//   // @override
//   // Future<void> onInit() async {
//   //   super.onInit();
//   //   // called immediately after the widget is allocated memory
//   //   await initPlatformState();
//   //   // await getWifi();
//   //    Timer.periodic(const Duration(seconds: 1), (timer) async {
//   //     await initPlatformState();
//   //     myCapture.connectedCellId = platformVersion['cid'].toString();
//   //     // print(platformVersion['cid']);
//   //     // print(myCapture.connectedCellId);
//   //     // getWifi();
//   //
//   //     // print(myCapture.bssids);
//   //     // print('get Data');
//   //   });
//   // }
//
//
//   Future<void> initPlatformState() async {
//     return await FlutterGsmcelllocation.getGsmCell
//         .then((value) => platformVersion = value)
//         .catchError((error) {
//       platformVersion = error.toString() as Map;
//     });
//   }
//
//
//
//   void counterIncrease() {
//     counter++;
//   }
//
//   // Future<void> initPlatformState() async {
//   //   Blue.getMethodChannel.setMethodCallHandler((call) {
//   //     if (call.method == "blueOnOff") {
//   //       blueOpenState = call.arguments;
//   //       // emit(BluetoothONState());
//   //     }
//   //     return;
//   //   });
//   // }
//   //
// void openBlue(bool onOff) async {
//   await Blue.blueOnOff(onOff);
//   bool blueOpenState = await Blue.getBlueIsEnabled;
//   print("Bluetooth switch callback:  $blueOpenState");
//   blueOpenState = blueOpenState;
//   // emit(BluetoothONState());
// }
//   //
//   // // Request Bluetooth permission from the user
//   // Future<void> enableBluetooth() async {
//   //   // Retrieving the current Bluetooth state
//   //   bluetoothState = await FlutterBluetoothSerial.instance.state;
//   //
//   //   // If the bluetooth is off, then turn it on first
//   //   // and then retrieve the devices that are paired.
//   //   if (bluetoothState == BluetoothState.STATE_OFF) {
//   //     await FlutterBluetoothSerial.instance.requestEnable();
//   //     await getPairedDevices();
//   //     return true;
//   //   } else {
//   //     await getPairedDevices();
//   //   }
//   //   return false;
//   // }
//   //
//   // Future<void> getPairedDevices() async {
//   //   var devices = [];
//   //
//   //   // To get the list of paired devices
//   //   try {
//   //     devices = await bluetooth.getBondedDevices();
//   //   } on PlatformException {
//   //     print("Error");
//   //   }
//   //   devicesList = devices;
//   //   // emit(BluetoothGetDeviceListState());
//   // }
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
//   String myssid;
//
//   Future<void> _initForegroundTask() async {
//     await FlutterForegroundTask.init(
//       androidNotificationOptions: const AndroidNotificationOptions(
//         channelId: 'notification_channel_id',
//         channelName: 'Foreground Notification',
//         channelDescription:
//             'This notification appears when the foreground service is running.',
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
//       htResultClient = await WiFiForIoTPlugin.getClientList(
//           onlyReachables, reachableTimeout);
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
//       await WiFiForIoTPlugin.getWiFiAPSSID();
//     } on PlatformException {
//       htResultNetwork = <WifiNetwork>[];
//     }
//     return htResultNetwork;
//   }
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
//
//   @override
//   void onButtonPressed(String id) {}
// }
//
// // TODO: get Capture Data saved and print it .
// // TODO: get Capture Counts that user get min 3 max 35.
// // TODO: make algorithm to create a signature.
// // TODO: print signature and store it in shared preferences.
//
// // Signature combinedSignature;
// // Capture localCurrentCapture;
// // int capturesCount;
//
// class Capture {
//   List<String> bssids;
//   List<double> levels;
//   String connectedSsid;
//   String connectedCellId;
//
// // String get cellID {
// //   return connectedCellId;
// // }
//
// // Creating the setter method
// // to set the input in Field/Property
//   set setCellID(String value) {
//     connectedCellId = value;
//   }
// }
// //
// //  class Signature extends Capture {
// // }
// // void createSignature() {
// //   //combinedSignature = new Signature();
// //   for (int i = 0; i < combinedSignature.levels.length(); i++)
// //     combinedSignature.levels.set(i, combinedSignature.levels.get(i) / capturesCount);
// //   double max = 0.0;
// //   combinedSignature.levels.forEach((x) { if (x > max) max = x;}) ;
// //   for (int i = 0; i < combinedSignature.levels.size(); i++)
// //     combinedSignature.levels.set(i, combinedSignature.levels.get(i) / max);
// //   combinedSignature.fileName = combinedSignature.timestamp+"-"
// //       +combinedSignature.locationName+".txt";
// //   signatures.add(combinedSignature);
// //   appendSignatureDataToSpreadSheet(combinedSignature);
// //   File file = saveSignatureFile(combinedSignature, combinedSignature.fileName);
// //
// //   capturesCount = 0;
// //   combinedSignature = null;
// // }
// //
// // File saveSignatureFile(Signature signature, String file_name) {
// //   Gson gson = new Gson();
// //   String data = gson.toJson(signature);
// //   return savefile(file_name, data);
// // }
// //
// // float compareSignatures(Fragment1.Signature original, Fragment1.Signature current) {
// //   float z = 0, z1=0, z2=0, z3=0, z4=0, intersect=0;
// //   float sum = 0;
// //   for (float x: original.levels) sum += x;
// //   for (int i = 0; i < original.bssids.size(); i++) {
// //     if (current.bssids.contains(original.bssids.get(i))) {
// //       intersect+=original.levels.get(i);
// //     }
// //   }
// //   intersect/=sum;
// //   if (isWifiConnected()) {
// //     if (original.connectedSsid.equals(current.connectedSsid)) z1 += 0.3;
// //     z3 += 0.5 * intersect;
// //   } else {
// //     z3 += 0.8 * intersect;
// //   }
// //   if (original.connectedCellId.equals(current.connectedCellId)) z4 += 0.2;
// //
// //   z=z1+z2+z3+z4;
// //   return z;
// // }
// ignore_for_file: Avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'package:blue/blue.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_gsmcelllocation/flutter_gsmcelllocation.dart';
import 'package:flutter_headset_detector/flutter_headset_detector.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:stats/stats.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wrl_home_quarantine_getx/Shared/network/end_points.dart';
import 'package:wrl_home_quarantine_getx/Shared/network/local/cache_helper.dart';
import 'package:wrl_home_quarantine_getx/database/models/user_model.dart';
import 'package:wrl_home_quarantine_getx/logic/controllers/test_controller.dart';
import 'package:wrl_home_quarantine_getx/views/widgets/Components.dart';

import 'auth_controller.dart';

class WifiController extends GetxController {
  //VARS AND OBJECTS SECTION
  //////////////////////////////////////////////////////////////////////////////
  // Bluetooth objects  and variables
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  BluetoothState bluetoothState = BluetoothState.UNKNOWN;
  BluetoothConnection connection;
  BluetoothConnection myConnection;
  BluetoothDevice device = const BluetoothDevice(
    address: '75:53:D4:B0:2B:2D', //'98:D3:61:FD:7D:22'
    name: '',
    isConnected: true,
  );
  Map<HeadsetType, HeadsetState> _headsetState = {
    HeadsetType.WIRED: HeadsetState.DISCONNECTED,
    HeadsetType.WIRELESS: HeadsetState.DISCONNECTED,
  };
  var bt = FlutterBluetoothSerial.instance;
  final _headsetDetector = HeadsetDetector();

////////////////////////////////////////////////////////////////////////////////
  //some view variables
  var capturesCount = 0.obs;
  var capturesCountc = -3.obs;
  var isInside = false.obs;
  UserModel myModel;

  //////////////////////////////////////////////////////////////////////////////
//wifi objects and variables
  List<WifiNetwork> wifiNetwork = [];
  List devicesList = [];
  String connectedSSID = 'Unknown';
  String connectedBSSID = 'Unknown';
  List<String> bssids = [];
  List<double> levels = [];

  // List<String> bssid = [];
  List<String> capBssids = [];

  // List<double> level = [];
  List<double> capLevels = [];

  var uniqeBSSIDLevelsMap = {};
  List uniqueLevelsList = [];
  List uniqueBSSIDSList = [];
  List<double> sigMean = [];
  double sigMedian = 0.0;
  double sigSTD = 0.0;
  double sigVar = 0.0;
  double sigSkew = 0.0;
  double sigKurt = 0.0;
  double capMean = 0.0;
  double capMedian = 0.0;
  double capSTD = 0.0;
  double capVar = 0.0;
  double capSkew = 0.0;
  double capKurt = 0.0;

  bool done = false;
  bool minAccessFounded = false;
  final NetworkInfo _networkInfo = NetworkInfo();

////////////////////////////////////////////////////////////////////////////////
  // Capture original =Capture();
  // Capture combinedSignature = Capture();
  // Capture localCurrentCapture = Capture();
  //objects of Capture
  Capture mSignature = Capture();
  MyStates sigStates = MyStates();

////////////////////////////////////////////////////////////////////////////////

  //FUNCS SECTION
  //////////////////////////////////////////////////////////////////////////////
  //init funcs
  @override
  void onInit() async {
    super.onInit();
    // await getConnectedWifi();
    // await getCID();
    // print(await getCID());
    // print('cache helper data' + CacheHelper.getData(key: 'sig'));
    // _initForegroundTask();
    // startForegroundTask();
    // FlutterForegroundTask.
    bool isConnected = await Blue.getBlueIsEnabled;

    if (!isConnected) {
      openBlue(true);
    }
    _headsetDetector.setListener((_val) {
      switch (_val) {
        case HeadsetChangedEvent.WIRED_CONNECTED:
          _headsetState[HeadsetType.WIRED] = HeadsetState.CONNECTED;
          break;
        case HeadsetChangedEvent.WIRED_DISCONNECTED:
          _headsetState[HeadsetType.WIRED] = HeadsetState.DISCONNECTED;
          break;
        case HeadsetChangedEvent.WIRELESS_CONNECTED:
          _headsetState[HeadsetType.WIRELESS] = HeadsetState.CONNECTED;
          break;
        case HeadsetChangedEvent.WIRELESS_DISCONNECTED:
          _headsetState[HeadsetType.WIRELESS] = HeadsetState.DISCONNECTED;
          break;
      }
    });
    // Timer.periodic(const Duration(seconds: 1), (Timer t) async {
    //   await FlutterForegroundTask.isRunningService.then((value) => null);
    //   bool isConnected = await Blue.getBlueIsEnabled;
    //   if (!isConnected) {
    //     openBlue(true);
    //   }
    //   _headsetDetector.getCurrentState.then((value) => _headsetState = value);
    //   // print(_mapStateToText(_headsetState[HeadsetType.WIRELESS]));
    // });

    // Timer.periodic(const Duration(seconds: 1), (timer) async {
    //   await getCID();
    //   print(await getCID());
    //   getConnectedWifi();
    //   if (CacheHelper.getData(key: 'done') ? true : false) {
    //     scanWifi();
    //     if (bssids.isNotEmpty) {
    //       union(await updateCurrentSignature());
    //     }
    //     createSignature();
    //     Map<String, dynamic> decodedData =
    //         jsonDecode(CacheHelper.getData(key: 'sig'));
    //     // print(decodedData['bssids'][5]);
    //     double score = compareSignatures(decodedData, combinedSignature);
    //     print('this is my value          $score');
    //     if (score < 0.5) {
    //       isInside.value = false;
    //       print('outside');
    //     } else {
    //       isInside.value = true;
    //       print('inside');
    //     }
    //     print('this is my value          ${isInside.value}');
    //     Fluttertoast.showToast(
    //         msg: score.toString(),
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.BOTTOM,
    //         timeInSecForIosWeb: 3,
    //         backgroundColor: Colors.black,
    //         textColor: Colors.white,
    //         fontSize: 10.0);
    //   }
    //   print('this is combined signature ${combinedSignature.toJson()}');
    //
    //   // print(await getCID());
    //   // print("LAC:" + _platformVersion['lac'].toString() + ",CID:" + _platformVersion['cid'].toString());
    //   // capture.connectedCellId =_platformVersion['cid'].toString();
    //   // capture.connectedSsid = connectedSSID;
    //   // print(capture.connectedCellId);
    //   // print(connectedSSID);
    // });

    // Timer.periodic(const Duration(seconds: 12), (timer) async {
    //   // await connect();
    // });
    // Timer.periodic(const Duration(minutes: 1), (timer) async {
    //   if (await bt.getBondStateForAddress(device.address) !=
    //       BluetoothBondState.bonded) {
    //     await bt
    //         .bondDeviceAtAddress(device.address,
    //             passkeyConfirm: true, pin: '1234')
    //         .then((_connection) {
    //       print('Connected to the device');
    //       connection = _connection as BluetoothConnection;
    //     }).catchError((error) {
    //       print('Cannot connect, exception occured');
    //       // print(error);
    //     });
    //   }
    //   await connect();
    //   FlutterBluetoothSerial.instance
    //       .onStateChanged()
    //       .listen((BluetoothState state) {
    //     bluetoothState = state;
    //   });
    // });
  }

////////////////////////////////////////////////////////////////////////////////

  //bluetooth funcs
  void openBlue(bool onOff) async {
    await Blue.blueOnOff(onOff);
    bool blueOpenState = await Blue.getBlueIsEnabled;
    print("Bluetooth switch callback:  $blueOpenState");
    blueOpenState = blueOpenState;
  }

  String _mapStateToText(HeadsetState state) {
    switch (state) {
      case HeadsetState.CONNECTED:
        return 'Connected';
      case HeadsetState.DISCONNECTED:
        return 'Disconnected';
      default:
        return 'Unknown';
    }
  }

  Future<void> connect() async {
    if (_mapStateToText(_headsetState[HeadsetType.WIRELESS]) ==
        'Disconnected') {
      await bt.getBondStateForAddress(device.address).then((value) {
        if (value == BluetoothBondState.bonded) {
          BluetoothConnection.toAddress(device.address).then((_connection) {
            print('Connected to the device');
            connection = _connection;
          }).catchError((error) {
            if (error ==
                'getBluetoothService() called with no BluetoothManagerCallback') {
              print('error');
            }
            print('Cannot connect, exception occured');
          });
        }
      });
    }
  }

////////////////////////////////////////////////////////////////////////////////

  //get cell id func
  Future<String> getCID() async {
    Map _platformVersion;
    try {
      _platformVersion = await FlutterGsmcelllocation.getGsmCell;
    } on PlatformException {
      _platformVersion = 'Failed to get platform version.' as Map;
      return null;
    }
    _platformVersion = _platformVersion;
    return "LAC:" +
        _platformVersion['lac'].toString() +
        ",CID:" +
        _platformVersion['cid'].toString();
  }

////////////////////////////////////////////////////////////////////////////////

  //get connected ssid func
  Future<void> getConnectedWifi() async {
    String wifiName, wifiBSSID;

    try {
      if (!kIsWeb && Platform.isIOS) {
        var status = await _networkInfo.getLocationServiceAuthorization();
        if (status == LocationAuthorizationStatus.notDetermined) {
          status = await _networkInfo.requestLocationServiceAuthorization();
        }
        if (status == LocationAuthorizationStatus.authorizedAlways ||
            status == LocationAuthorizationStatus.authorizedWhenInUse) {
          wifiName = await _networkInfo.getWifiName();
        } else {
          wifiName = await _networkInfo.getWifiName();
        }
      } else {
        wifiName = await _networkInfo.getWifiName();
      }
    } on PlatformException catch (e) {
      e;
      wifiName = 'Failed to get Wifi Name';
    }

    try {
      if (!kIsWeb && Platform.isIOS) {
        var status = await _networkInfo.getLocationServiceAuthorization();
        if (status == LocationAuthorizationStatus.notDetermined) {
          status = await _networkInfo.requestLocationServiceAuthorization();
        }
        if (status == LocationAuthorizationStatus.authorizedAlways ||
            status == LocationAuthorizationStatus.authorizedWhenInUse) {
          wifiBSSID = await _networkInfo.getWifiBSSID();
        } else {
          wifiBSSID = await _networkInfo.getWifiBSSID();
        }
      } else {
        wifiBSSID = await _networkInfo.getWifiBSSID();
      }
    } on PlatformException catch (e) {
      e;
      wifiBSSID = 'Failed to get Wifi BSSID';
    }
    connectedSSID = wifiName;
    connectedBSSID = wifiBSSID;
    // _connectionStatus = 'Wifi Name: $wifiName\n' 'Wifi BSSID: $wifiBSSID\n';
  }

////////////////////////////////////////////////////////////////////////////////

  //wifi scanning funcs

  Future<List<WifiNetwork>> loadWifiList() async {
    List<WifiNetwork> htResultNetwork;
    try {
      htResultNetwork = await WiFiForIoTPlugin.loadWifiList();
    } on PlatformException {
      htResultNetwork = <WifiNetwork>[];
    }
    return htResultNetwork;
  }

  void scanWifi() async {
    await loadWifiList().then(
      (value) {
        wifiNetwork = value;
        capturesCount++;
        // print(capturesCount);
      },
    ).catchError(
      (error) {
        print(error);
      },
    );

    for (var device in wifiNetwork) {
      // print(device.ssid);
      // print(device.bssid);
      // print(device.level.toDouble());
      bssids.add(device.bssid);
      levels.add(device.level.toDouble() + 150);
    }

    // print(bssids);
    // print(levels);
    // print(bssids);
    // print(levels);
    // print(levels);
    // print('wifi scanned');
  }

  Future<List<APClient>> getClientList(
      bool onlyReachables, int reachableTimeout) async {
    List<APClient> htResultClient;
    try {
      htResultClient = await WiFiForIoTPlugin.getClientList(
          onlyReachables, reachableTimeout);
    } on PlatformException {
      htResultClient = <APClient>[];
    }

    return htResultClient;
  }

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  //
  // void openBlue(bool onOff) async {
  //   await Blue.blueOnOff(onOff);
  //   bool blueOpenState = await Blue.getBlueIsEnabled;
  //   print("Bluetooth switch callback:  $blueOpenState");
  //   blueOpenState = blueOpenState;
  // }

  //////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
  //foreground task funcs
  void startCallback() {
    // The setTaskHandler function must be called to handle the task in the background.
    // FlutterForegroundTask.setTaskHandler(FirstTaskHandler());
    print('start callback called');
  }

  void updateCallback() {
    // FlutterForegroundTask.setTaskHandler(FirstTaskHandler());
  }

  Future<void> onDestroy(DateTime timestamp) async {}

  ReceivePort receivePort;

  Future<void> _initForegroundTask() async {
    await FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'notification_channel_id',
        channelName: 'Foreground Notification',
        channelDescription:
            'This notification appears when the foreground service is running.',
        channelImportance: NotificationChannelImportance.LOW,
        priority: NotificationPriority.LOW,
        iconData: const NotificationIconData(
          resType: ResourceType.mipmap,
          resPrefix: ResourcePrefix.ic,
          name: 'launcher',
        ),
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: true,
        playSound: false,
      ),
      foregroundTaskOptions: const ForegroundTaskOptions(
        interval: 100,
        autoRunOnBoot: true,
        allowWifiLock: true,
      ),
      printDevLog: true,
    );
  }

  Future<bool> startForegroundTask() async {
    // You can save data using the saveData function.
    await FlutterForegroundTask.saveData(key: 'customData', value: 'hello');

    ReceivePort receivePort;
    if (await FlutterForegroundTask.isRunningService) {
      receivePort = await FlutterForegroundTask.restartService();
    } else {
      receivePort = await FlutterForegroundTask.startService(
        notificationTitle: 'Home Quarantine is running',
        notificationText: 'Tap to return to the app',
        callback: startCallback,
      );
    }

    if (receivePort != null) {
      receivePort = receivePort;
      receivePort?.listen((message) {
        if (message is DateTime) {
          // print('receive timestamp: $message');
        } else if (message is int) {
          // print('receive updateCount: $message');
        }
      });

      return true;
    }

    return false;
  }

  void getInitForeground() => _initForegroundTask();

  void getStartForeground() => startForegroundTask();

  // void getDevices() => getDeviceItems();
  /////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////
  ///new algorithm
  void checkAvailablity() {
    // var uniqeBSSIDLevelsMap ={};
    // for (var element in bssids) {
    //   if (!uniqeBSSIDLevelsMap.containsKey(element)) {
    //     uniqeBSSIDLevelsMap[element] = [];
    //   } else {
    //     uniqeBSSIDLevelsMap[element] = getLevels(element);
    //   }
    // }
    var unique = bssids;
    unique = bssids.toSet().toList();
    // print(unique);
    print('this is my uniqeBSSIDLevelsMap keys      $unique');
    if (unique.length < 5) {
      minAccessFounded = true;
    } else {
      minAccessFounded = false;
    }
  }

  void getUnique() {
    var unique = bssids.toSet().toList();

    for (var element in bssids) {
      if (!uniqeBSSIDLevelsMap.containsKey(element)) {
        uniqeBSSIDLevelsMap[element] = [];
      } else {
        uniqeBSSIDLevelsMap[element] = getLevels(element);
      }
    }
    uniqueLevelsList = uniqeBSSIDLevelsMap.values.toList();
    uniqueBSSIDSList = uniqeBSSIDLevelsMap.keys.toList();
    List uniqeLev = [];
    for (var element in unique) {
      uniqeLev.add(uniqueLevelsList[uniqueBSSIDSList.indexOf(element)]);
    }
    // get list of averages of unique list
    sigMean = [];
    for (List<double> element in uniqeLev) {
      sigMean.add(element.average);
    }
    // print(sigMean);

    //get states for list of averages of unique list
    final st = Stats.fromData(sigMean);

    sigMedian = st.median;
    sigSTD = STD(sigMean);
    sigVar = pow(sigSTD, 2);
    sigKurt = kurtosis(sigMean);
    sigSkew = skewness(sigMean);

    // //put data to signature
    mSignature.bssids = bssids;
    mSignature.levels = levels;
    mSignature.averageLevels = sigMean;
    mSignature.uniqueBssidsLevels = uniqueLevelsList;
    mSignature.uniqueBssids = uniqueBSSIDSList;
    //
    // //put states data to sig states
    sigStates.mean = sigMean.average;
    sigStates.median = sigMedian;
    sigStates.standardDeviation = sigSTD;
    sigStates.variance = sigVar;
    sigStates.skewness = sigSkew;
    sigStates.kurtosis = sigKurt;
    //
    // print(uniqeBSSIDLevelsMap);
    print(mSignature.toJson());
    print(sigStates.toJson());

    // return uniqeBSSIDLevelsMap.toString();
  }

  List<double> getLevels(String bssid) {
    List<double> _levels = [];
    for (var i = 0; i < bssids.length; i++) {
      if (bssids[i] == bssid) {
        _levels.add(levels[i]);
      }
    }
    return _levels;
  }

  void clear() {
    bssids.clear();
    levels.clear();
    capturesCount.value = 0;
  }

  void saveData() {
    String encodedSigData = json.encode(mSignature.toJson());
    CacheHelper.saveData(key: 'sig', value: encodedSigData);
    print('endcoded sig data  ' + encodedSigData);

    String encodedSigStats = json.encode(sigStates.toJson());
    CacheHelper.saveData(key: 'sigStats', value: encodedSigStats);

    String getEncodedSigData = CacheHelper.getData(key: 'sig');
    Map decodedSigData = json.decode(getEncodedSigData);
    print('decoded sig data  ' + decodedSigData.toString());

    String getEncodedSigStats = CacheHelper.getData(key: 'sigStats');
    Map decodedSigStats = json.decode(getEncodedSigStats);
    print('decoded sig states  ' + decodedSigStats.toString());
  }

//Function to get std
  double STD(List<double> arr) {
    double sum1 = 0;
    double std = 0;
    final st = Stats.fromData(arr);
    for (int i = 0; i < st.count; i++) {
      sum1 += pow((arr[i] - st.average), 2);
    }
    std = sqrt((sum1 / (st.count - 1)));
    return std;
  }

// Function to calculate skewness.
  double skewness(List<double> arr) {
    // Find skewness using above formula
    final st = Stats.fromData(arr);
    double sum = 0;
    double sum1 = 0;
    double sum2 = 0;
    double std = 0;
    double fact = 0;

    fact = (st.count / ((st.count - 1) * (st.count - 2)));

    for (int i = 0; i < st.count; i++) {
      sum1 += pow((arr[i] - st.average), 2);
    }
    std = sqrt((sum1 / (st.count - 1)));

    for (int i = 0; i < arr.length; i++) {
      sum += pow((arr[i] - st.average), 3);
    }
    sum2 = pow(std, 3);

    return fact * (sum / sum2);
  }

// Function to calculate kurtosis.
  double kurtosis(List<double> arr) {
    // Find skewness using above formula
    final st = Stats.fromData(arr);
    double sum = 0;
    double sum2 = 0;
    double fact = 0;
    double fact2 = 0;
    double sum3 = 0;
    double std = 0;

    for (int i = 0; i < st.count; i++) {
      sum3 += pow((arr[i] - st.average), 2);
    }
    std = sqrt((sum3 / (st.count - 1)));

    fact = ((st.count * (st.count + 1)) /
        ((st.count - 1) * (st.count - 2) * (st.count - 3)));
    fact2 = ((3 * pow((st.count - 1), 2)) / ((st.count - 2) * (st.count - 3)));

    for (int i = 0; i < st.count; i++) {
      sum += pow((arr[i] - st.average), 4);
    }
    sum2 = sum / pow((std), 4);

    return (fact * (sum2)) - fact2;
  }

  //Function to calculate covariance
  double Covar(List<double> arr1, List<double> arr2) {
    final st1 = Stats.fromData(arr1);
    final st2 = Stats.fromData(arr2);
    List xListSubAvg = [];
    List yListSubAvg = [];
    List mulList = [];
    double mulListSum = 0;

    for (var element in arr1) {
      xListSubAvg.add(element - st1.average);
    }
    for (var element in arr2) {
      yListSubAvg.add(element - st2.average);
    }
    for (var element in xListSubAvg) {
      mulList.add(element * yListSubAvg[xListSubAvg.indexOf(element)]);
    }
    mulListSum = mulList.reduce((value, element) => value + element);
    return (mulListSum / (arr1.length - 1));
  }

  //Function to calculate correlation
  double Correl(List<double> arr1, List<double> arr2) {
    double mCov = Covar(arr1, arr2);
    double stdA = STD(arr1);
    double stdB = STD(arr2);
    return mCov / (stdA * stdB);
  }

  Future<dynamic> doUpdate(context) async {
    DioHelper.putData(
            url: updateViolationStatus,
            data: {
              'user_id': 1,
              'isInside': true,
              'isPaired': false,
            },
            token: myModel.data.token)
        .then((value) {
      if (value != null) {
        print(value.data);
      }
      // print();
    }).catchError(
      (error) {
        print(error.toString());
      },
    );
  }

/////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//old algorithm funcs
//   Future<Capture> updateCurrentSignature() async {
//     print('this is bssids from update\n$bssids' '\n\n');
//     Capture capture = Capture();
//     capture.bssids = []; //for one capture
//     capture.levels = [];
//     for (var b in bssids) {
//       capture.bssids.add(b);
//     }
//     for (var l in levels) {
//       capture.levels.add((l + 120));
//     }
//     if (connectedSSID != 'Unknown') {
//       capture.connectedSsid = connectedSSID;
//     }
//     capture.connectedCellId = await getCID();
//     localCurrentCapture = capture;
//     print('update Current Sig is done\n\n');
//     // emptyData();
//     bssids = [];
//     levels = [];
//     print('this is bssids$bssids' 'End\n\n');
//     print('this is bssids should be empty');
//
//     return localCurrentCapture;
//   }
//
//   Future<void> union(Capture currentCapture) async {
//     if (connectedSSID != 'Unknown') {
//       combinedSignature.connectedSsid = connectedSSID;
//     }
//     combinedSignature.connectedCellId = await getCID();
//     Capture newS = currentCapture;
//     for (var str in newS.bssids) {
//       // int i = combinedSignature.bssids.indexOf(str);
//       if (!combinedSignature.bssids.contains(str)) {
//         combinedSignature.bssids.add(str);
//         combinedSignature.levels.add(newS.levels[newS.bssids.indexOf(str)]);
//       } else {
//         combinedSignature.levels[combinedSignature.bssids.indexOf(str)] =
//             combinedSignature.levels[combinedSignature.bssids.indexOf(str)] +
//                 newS.levels[newS.bssids.indexOf(str)];
//       }
//     }
//     print('union is done');
//     print(combinedSignature.toJson());
//   }
//
//   createSignature() async {
//     for (int i = 0; i < combinedSignature.levels.length; i++) {
//       combinedSignature.levels[i] =
//           combinedSignature.levels[i] / (capturesCount.ceil());
//     } //get avarage of levels
//
//     double max = -1;
//
//     for (var x in combinedSignature.levels) {
//       //get max level
//       if (x > max) max = x;
//     }
//
//     for (int i = 0; i < combinedSignature.levels.length; i++) {
//       combinedSignature.levels[i] = combinedSignature.levels[i] / max;
//     } //normalize devide level  over max all < 1 even max = 1
// //save signature
// //     String data =
// //         '{bssids: ${combinedSignature.bssids}, levels: ${combinedSignature.levels}, connectedSsid: ${combinedSignature.connectedSsid}, connectedCellId: ${combinedSignature.connectedCellId}}'; // that line encode signature to string next step save it in cache helper
//     String data = jsonEncode(combinedSignature.toJson());
//     // CacheHelper.saveData(key: 'sig', value: data);
//     // print(data);
//     // Fluttertoast.showToast(
//     //     msg: data,
//     //     toastLength: Toast.LENGTH_SHORT,
//     //     gravity: ToastGravity.BOTTOM,
//     //     timeInSecForIosWeb: 3,
//     //     backgroundColor: Colors.black,
//     //     textColor: Colors.white,
//     //     fontSize: 10.0);
//     combinedSignature = combinedSignature;
//     print('sig is created');
//     return data;
// // shared pref will save it to be done
// //end
//   } //createSignature
//
//   double compareSignatures(Map<String, dynamic> original, Capture current) {
//     double z = 0, z1 = 0, z2 = 0, z3 = 0, z4 = 0, intersect = 0;
//     double sum = 0;
//
//     for (var element in original['levels']) {
//       sum += element;
//     }
//
//     for (var element in original['bssids']) {
//       if (current.bssids.contains(element)) {
//         intersect += original['levels'][original['bssids'].indexOf(
//             element)]; //original.levels[the index of original bssid element]
//       }
//     }
//
//     intersect /= sum;
//     if (connectedSSID != 'Unknown') {
//       combinedSignature.connectedSsid = connectedSSID;
//     }
//     if (connectedSSID != 'Unknown') {
//       if (original['connectedSsid'] == current.connectedSsid) z1 += 0.3;
//       z3 += 0.5 * intersect;
//     } else {
//       z3 += 0.8 * intersect;
//     }
//     if (original['connectedCellId'] == current.connectedCellId) z4 += 0.2;
//
//     z = z1 + z2 + z3 + z4;
//     return z;
//   }
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
// new algorithm
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
}

// class Capture {
//   List bssids = [];
//   List levels = [];
//   String connectedCellId;
//   String connectedSsid;
//
//   Map<dynamic, dynamic> toJson() => {
//         'bssids': bssids,
//         'levels': levels,
//         'connectedCellId': connectedCellId,
//         'connectedSsid': connectedSsid,
//       };
// }

class Capture {
  List bssids = [];
  List levels = [];
  List uniqueBssidsLevels = [];
  List uniqueBssids = [];
  List averageLevels = [];

  // String connectedCellId;
  // String connectedSsid;

  Capture({
    this.levels,
    this.bssids,
    this.averageLevels,
    // this.connectedCellId,
    // this.connectedSsid,
    this.uniqueBssidsLevels,
    this.uniqueBssids,
  });

  Map<dynamic, dynamic> toJson() => {
        'bssids': bssids,
        'levels': levels,
        'uniqueBssidsLevels': uniqueBssidsLevels,
        'averageLevels': averageLevels,
        // 'connectedCellId': connectedCellId,
        // 'connectedSsid': connectedSsid,
        'uniqueBssids': uniqueBssids,
      };

  Capture.fromJson(Map json) {
    bssids = json['bssids'];
    levels = json['levels'];
    uniqueBssidsLevels = json['uniqueBssidsLevels'];
    averageLevels = json['averageLevels'];
    // connectedCellId = json['connectedCellId'];
    // connectedSsid = json['connectedSsid'];
    uniqueBssids = json['uniqueBssids'];
  }
}

class MyStates {
  double mean;
  double median;
  double standardDeviation;
  double variance;
  double skewness;
  double kurtosis;

  MyStates({
    this.standardDeviation,
    this.median,
    this.kurtosis,
    this.mean,
    this.skewness,
    this.variance,
  });

  Map<dynamic, dynamic> toJson() => {
        'mean': mean,
        'median': median,
        'standardDeviation': standardDeviation,
        'variance': variance,
        'skewness': skewness,
        'kurtosis': kurtosis,
      };

  MyStates.fromJson(Map json) {
    mean = json['mean'];
    median = json['median'];
    standardDeviation = json['standardDeviation'];
    variance = json['variance'];
    skewness = json['skewness'];
    kurtosis = json['kurtosis'];
  }
}
// class CapSig{
//   List bssids = [];
//   List levels = [];
//   String connectedCellId;
//   String connectedSsid;
//
//   CapSig({this.bssids, this.levels, this.connectedSsid, this.connectedCellId});
//
//
//   CapSig.fromJson(Map<String, dynamic> json)
//       : bssids = json['bssids'],
//         levels = json['levels'],
//         connectedCellId = json['connectedCellId'],
//         connectedSsid = json['connectedSsid'];
// }
// class Capture {
//   List bssids;
//   List levels;
//   String connectedSsid;
//   String connectedCellId;
//
// // String get cellID {
// //   return connectedCellId;
// // }
//
// // Creating the setter method
// // to set the input in Field/Property
//   set setCellID(String value) {
//     connectedCellId = value;
//   }
// }

// Capture combinedSignature;
// Capture localCurrentCapture;
// int capturesCount;

// class Capture {
// long timestamp;
// ArrayList<String> bssids;
// ArrayList<Float> levels;
// String connectedSsid;
// String connectedCellId;
// }
//
//

// after done button
//       |||
//       vvv
//creat signature will be done after press done button
// void createSignature() {
// //combinedSignature = new Signature();
// for (int i = 0; i < combinedSignature.levels.size(); i++)//get size of bssids list
// combinedSignature.levels.set(i, combinedSignature.levels.get(i) / capturesCount);//get avarage of levels
//
// float max = Float.MIN_VALUE;//get max level
// for (float x: combinedSignature.levels) if (x > max) max = x;
//
// for (int i = 0; i < combinedSignature.levels.size(); i++)
// combinedSignature.levels.set(i, combinedSignature.levels.get(i) / max);//normalize devide level  over max all < 1 even max = 1
//
// //save signature
// combinedSignature.fileName = combinedSignature.timestamp+"-"
//
// +combinedSignature.locationName+".txt";
//
// File file = saveSignatureFile(combinedSignature, combinedSignature.fileName);
//
// Gson gson = new Gson();
//
// // shared pref will save it to be done
// //end
// }//createSignature
//
// File saveSignatureFile(Signature signature, String file_name) {
// Gson gson = new Gson();
// String data = JsonEncoder(signature);// that line encode signature to string next step save it in cache helper
// return savefile(file_name, data);
// }
//
// float compareSignatures(Fragment1.Signature original, Fragment1.Signature current) {
//
// float z = 0, z1=0, z2=0, z3=0, z4=0, intersect=0;
// float sum = 0;
//
// for (float x: original.levels) sum += x;
//
// for (int i = 0; i < original.bssids.size(); i++) {
//   if (current.bssids.contains(original.bssids.get(i))){intersect+=original.levels.get(i);}
// }
//
// intersect/=sum;
//
// if (isWifiConnected()) {
//   if (original.connectedSsid.equals(current.connectedSsid)) z1 += 0.3;
// z3 += 0.5 * intersect;
// } else {
// z3 += 0.8 * intersect;
// }
// if (original.connectedCellId.equals(current.connectedCellId)) z4 += 0.2;
//
// z=z1+z2+z3+z4;
// return z;
// }

//
// //لما اعمل  capture
//
// /*
// capture button do this:
//         |||
//         vvv
// captureCount++
// new scan
// call updateCurrentSignature
// call union
//`
// * */

// if (capturesCount==1) {//if it is the first capture
// combinedSignature = updateCurrentSignature();
// } else {//normal case
// union(updateCurrentSignature());
// }
//
