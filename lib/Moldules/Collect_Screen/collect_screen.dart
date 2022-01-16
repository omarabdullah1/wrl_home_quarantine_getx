// // ignore_for_file: file_names
// // ignore_for_file: avoid_print
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:home_quarantine/Moldules/WIFI_Scanner/wifi_scanner.dart';
// import '../../Shared/Components/globals.dart';
//
// class CollectScreen extends StatefulWidget {
//   const CollectScreen({Key key}) : super(key: key);
//
//   @override
//   _CollectScreenState createState() => _CollectScreenState();
// }
//
// class _CollectScreenState extends State<CollectScreen> {
//   @override
//   void initState() {
//     const sec = Duration(seconds: 5);
//
//     Timer.periodic(sec, (Timer t) => getWifis());
//     Timer.periodic(
//         sec,
//             (Timer t) => networkList.isNotEmpty
//             //Ignore
//             ? networkList.forEach((element) {
//           print(element.ssid +
//               '\t' +
//               element.bssid +
//               '\t' +
//               element.level.toString());
//         })
//             : null);
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Main'),
//       ),
//     );
//   }
// }
