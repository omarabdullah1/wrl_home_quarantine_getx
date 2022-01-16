// // ignore_for_file: avoid_print
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quarantine_clone/Controller/controller.dart';
// import 'package:timer_button/timer_button.dart';
//
//
// class WIFIScanner extends GetView<AppController> {
//   const WIFIScanner({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 10),
//               const Text(
//                 'Wi-Fi is Found',
//                 style: TextStyle(fontSize: 25),
//                 textAlign: TextAlign.center,
//               ),
//               Obx(
//                 () => Text(
//                   'Wifi scanned : ${controller.counter}',
//                   style: const TextStyle(fontSize: 25),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               TimerButton(
//                   label: 'Scan',
//                   onPressed: () {
//                     controller.getWifi();
//                   },
//                   timeOutInSeconds: 2),
//               ListView.builder(
//                 itemBuilder: (builder, index) {
//                   if (controller.wifiNetwork.isNotEmpty) {
//                     return Container(
//                       color: Colors.blueAccent,
//                       child: ListTile(
//                         title: Column(
//                           children: [
//                             Text(controller.wifiNetwork[index].ssid),
//                             Text(controller.wifiNetwork[index].bssid),
//                             Text(controller.wifiNetwork[index].level
//                                 .toString()),
//                           ],
//                         ),
//                       ),
//                     );
//                   } else {
//                     return const Center(
//                       child: Text('No wifi found'),
//                     );
//                   }
//                 },
//                 itemCount: controller.wifiNetwork.length,
//                 shrinkWrap: true,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
