// ignore_for_file: avoid_print

import 'dart:math';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter/material.dart';
import 'package:wrl_home_quarantine_getx/Moldules/Cell_Info/cell_info.dart';
import 'package:wrl_home_quarantine_getx/Shared/Components/Components.dart';




class SpeedometerContainer extends StatefulWidget {
  const SpeedometerContainer({Key key}) : super(key: key);

  @override
  _SpeedometerContainerState createState() => _SpeedometerContainerState();
}

class _SpeedometerContainerState extends State<SpeedometerContainer> {
  double velocity = 0;
  double highestVelocity = 0.0;

  @override
  void initState() {
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      _onAccelerate(event);
    });
    super.initState();
  }

  void _onAccelerate(UserAccelerometerEvent event) {
    double newVelocity =
        sqrt(event.x * event.x + event.y * event.y + event.z * event.z);

    if ((newVelocity - velocity).abs() < 1) {
      return;
    }

    setState(() {
      velocity = newVelocity;
      if (velocity > 1) {
        print(velocity);
      }
      if (velocity > highestVelocity) {
        highestVelocity = velocity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Highest speed:\n${highestVelocity.toStringAsFixed(2)} km/h',
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Text(
                'speed:\n${velocity.toStringAsFixed(2)} km/h',
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                  onPressed: () {
                    navigateTo(context, const CellInfo());
                  },
                  child: const Text('next'))
            ],
          ),
        ));
  }
}
