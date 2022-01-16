// ignore_for_file: avoid_print, deprecated_member_use, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_button/timer_button.dart';
import 'package:wrl_home_quarantine_getx/logic/controllers/wifi_controller.dart';
import 'package:wrl_home_quarantine_getx/routes/routes.dart';
import 'package:wrl_home_quarantine_getx/views/widgets/Components.dart';

class WifiView extends GetView<WifiController> {
  const WifiView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context)
        .size
        .height; // var lac =controller.platformVersion["lac"];
    // var cid =controller.platformVersion["cid"];
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 248, 250, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height / 16),
                const Text(
                  'Scan Home',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: width / 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '1. Flow throughout your home rooms',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        '2. At each room,press the following "scan" button',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        '3. After you finish scanning  your home, press \n \t \t"finish" button',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 8,
                ),
                SizedBox(
                  height: 40,
                  width: width - 100,
                  child: TimerButton(
                    label: 'CAPTURE',
                    onPressed: () async {
                      controller.scanWifi();
                      controller.checkAvailablity();
                      controller.capturesCountc++;

                    },
                    timeOutInSeconds: 2,
                    buttonType: ButtonType.ElevatedButton,
                    color: Colors.indigo[900],
                    disabledColor: Colors.indigo[300],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Obx(
                  () => SizedBox(
                    height: 40,
                    width: width - 100,
                    child: ElevatedButton(
                      onPressed: controller.capturesCount >= 3
                          ? () {
                              controller.checkAvailablity();
                              if(!controller.minAccessFounded) {
                                controller.getUnique();
                                controller.saveData();
                                Get.offAndToNamed(AppRoutes.test);
                              }
                              else {
                                showToast(text: 'Please Scan more rooms',state: ToastStates.ERROR);
                              }
                            }
                          : null,
                      child: Obx(
                        () => Text(
                          controller.capturesCount < 3
                              ? '${controller.capturesCountc}'
                              : 'DONE',
                          style: TextStyle(
                            color: controller.capturesCount < 3
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo[900],
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(onPressed: () {
                //   controller.checkRepeated();
                // }, child: const Text('R')),
                SizedBox(
                  height: height / 8,
                ),
                Container(
                  height: 80,
                  width: width - 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Scanned Rooms',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Obx(() => Text(
                              '${controller.capturesCount}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    )),
                    const VerticalDivider(
                      color: Colors.black,
                      width: 10.0,
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'Be Ready for the Next Scan after',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '20 seconds',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )),
                  ]),
                ),
                // Row(
                //   children: [],
                // ),
                // ListView.builder(
                //   itemBuilder: (builder, index) {
                //     if (appController.wifiNetwork.isNotEmpty) {
                //       return Container(
                //         color: Colors.blueAccent,
                //         child: ListTile(
                //           title: Column(
                //             children: [
                //               Text(appController.wifiNetwork[index].ssid),
                //               Text(appController.wifiNetwork[index].bssid),
                //               Text(appController.wifiNetwork[index].level
                //                   .toString()),
                //             ],
                //           ),
                //         ),
                //       );
                //     } else {
                //       return const Center(
                //         child: Text('No wifi found'),
                //       );
                //     }
                //   },
                //   itemCount: appController.wifiNetwork.length,
                //   shrinkWrap: true,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
