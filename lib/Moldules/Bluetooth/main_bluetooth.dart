// // ignore_for_file: avoid_print, deprecated_member_use, duplicate_ignore
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
// import 'package:get/get.dart';
// import 'package:quarantine_clone/Controller/controller.dart';
//
// class BluetoothApp extends StatefulWidget {
//   const BluetoothApp({Key key}) : super(key: key);
//
//   @override
//   _BluetoothAppState createState() => _BluetoothAppState();
// }
//
// class _BluetoothAppState extends State<BluetoothApp> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final AppController appController = Get.put(AppController());
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) => initBluetooth());
//     // _connected =
//     !appController.blueOpenState ? appController.openBlue(true) : null;
//     appController.initPlatformState();
//     const oneSec = Duration(seconds: 5);
//     const sec = Duration(seconds: 1);
//     Timer.periodic(
//         oneSec, (Timer t) async {
//           if(!appController.blueOpenState){appController.openBlue(true);}
//         }
//         );
//
//     Timer.periodic(oneSec, (Timer t) async {
//
//       if(!appController.connectedBT){
//       _connectAddress('75:53:D4:B0:2B:2D'); //redmi Air dots R2
//       }
//     } );
//     Timer.periodic(
//         sec,
//             (Timer t) {  appController.connectedBT?print('true'):print('false');});
//
//     // Get current state
//     FlutterBluetoothSerial.instance.state.then((state) {
//       setState(() {
//         appController.bluetoothState= state;
//       });
//     });
//     appController.enableBluetooth();
//
//     // Listen for further state changes
//     FlutterBluetoothSerial.instance
//         .onStateChanged()
//         .listen((BluetoothState state) {
//       setState(() {
//         appController.bluetoothState = state;
//         if (appController.bluetoothState == BluetoothState.STATE_OFF) {
//           appController.isButtonUnavailable = true;
//         }
//         appController.getPairedDevices();
//       });
//     });
//   }
//
//   // Now, its time to build the UI
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: const Text("Bluetooth screen"),
//         actions: [
//           FlatButton.icon(
//             icon: const Icon(
//               Icons.refresh,
//               color: Colors.white,
//             ),
//             label: const Text(
//               "Refresh",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//             splashColor: Colors.deepPurple,
//             onPressed: () async {
//               await appController.getPairedDevices().then((context) {
//               });
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           Visibility(
//             visible: appController.isButtonUnavailable &&
//                 appController.bluetoothState == BluetoothState.STATE_ON,
//             child: const LinearProgressIndicator(
//               backgroundColor: Colors.yellow,
//               valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//             ),
//           ),
//             ],
//       )
//     );
//   }
//   Future<void> initBluetooth() async {
//     appController.openBlue(false);
//     appController.openBlue(true);
//
//     bool isConnected = await appController.bluetoothManager.isConnected;
//
//     appController.bluetoothManager.state.listen((state) {
//       print('cur device status: $state');
//
//       switch (state) {
//         case BluetoothManager.CONNECTED:
//           setState(() {
//             appController.connectedBT = true;
//             // tips = 'connect success';
//           });
//           break;
//         case BluetoothManager.DISCONNECTED:
//           setState(() {
//             appController.connectedBT = false;
//             // tips = 'disconnect success';
//           });
//           break;
//         default:
//           break;
//       }
//     });
//
//     if (!mounted) return;
//
//     if (isConnected) {
//     }
//   }
//   void _connectAddress(String address) async {
//     setState(() {
//       appController.isButtonUnavailable = true;
//     });
//       if (!appController.connectedBT) {
//         await BluetoothConnection.toAddress(address)
//             .then((_connection) {
//           print('Connected to the device');
//           appController.connection = _connection;
//           setState(() {
//             appController.connectedBT = true;
//           });
//
//           appController.connection.input.listen(null).onDone(() {
//             if (appController.isDisconnecting) {
//               print('Disconnecting locally!');
//             } else {
//               print('Disconnected remotely!');
//             }
//             if (mounted) {
//               setState(() {});
//             }
//           });
//         }).catchError((error) {
//           print('Cannot connect, exception occurred');
//           print(error);
//         });
//
//         setState(() => appController.isButtonUnavailable = false);
//       }
//     }
//   }
//
