import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_foreground_task/ui/with_foreground_task.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:wrl_home_quarantine_getx/logic/controllers/test_controller.dart';

class TestView extends GetView<TestController> {
  const TestView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.done;
    return WithForegroundTask(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(247, 248, 250, 1),
        appBar: AppBar(
          leading: null,
          elevation: 0.0,
          backgroundColor: const Color.fromRGBO(247, 248, 250, 1),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Your Status',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
                const SizedBox(
                  height: 150.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: 200.0,
                      lineWidth: 8.0,
                      animation: true,
                      percent: 0.8,
                      center: SizedBox(
                        height: 200,
                        width: 200.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '4',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 60.0,
                                color: Colors.indigo[900],
                              ),
                            ),
                            // const SizedBox(
                            //   width: 15.0,
                            // ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              'Remaining\nQuarantine\nDays',
                              style: TextStyle(
                                color: Colors.indigo[900],
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.indigo[900],
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 120.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await controller.doUpdate(context);
                      },
                      child: const Text('doUpdate'),
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Your Home Status',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: controller.isInside.isFalse
                                  ? Colors.red
                                  : Colors.green,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Center(
                              child: Text(
                                controller.isInside.isFalse
                                    ? 'Outside'
                                    : 'Inside',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            width: 120.0,
                            height: 30.0,
                          ),
                        ],
                      ),
                      // Text('isInside ${}'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
