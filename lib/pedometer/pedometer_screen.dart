import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PedometerScreen extends StatefulWidget {
  const PedometerScreen({super.key});

  @override
  State<PedometerScreen> createState() => _PedometerScreenState();
}

class _PedometerScreenState extends State<PedometerScreen> {
  // final catsBox = collection.openBox<Map>('cats');
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  late StreamSubscription _subscription;
  late String _status = '';
  late int _todaySteps = 0;
  late int _steps = 0;
  late DateTime _timeStamp = DateTime.now();
  // late String a = '';

  @override
  void initState() {
    // _stepCountStream;
    // _pedestrianStatusStream;
    // _status;
    // _steps;

    initPlatformState();
    super.initState();
  }

  // @override
  // void dispose() {
  //   stopCount();
  //   super.dispose();
  // }

  // void onTotalStepCount(StepCount event) {
  //   if (kDebugMode) {
  //     print(event);
  //   }
  //   setState(() {
  //     // a = event.timeStamp.toString();
  //     _totalSteps = event.totalSteps;
  //   });
  // }

  Future<int> onStepCount(StepCount event) async {
    var stepsBox = await Hive.openBox('steps');

    _steps = event.steps;
    if (kDebugMode) {
      print(event);
    }
    int savedStepsCountKey = 999999;
    int? savedStepsCount = stepsBox.get(savedStepsCountKey, defaultValue: 0);

    if (_steps < savedStepsCount!) {
      // Upon device reboot, pedometer resets. When this happens, the saved counter must be reset as well.
      savedStepsCount = 0;
      // persist this value using a package of your choice here
      stepsBox.put(savedStepsCountKey, savedStepsCount);
    }
    // load the last day saved using a package of your choice here
    int todayDayNo = Jiffy(DateTime.now()).dayOfYear;
    int lastDaySavedKey = 888888;
    int? lastDaySaved = stepsBox.get(lastDaySavedKey, defaultValue: 0);

    // When the day changes, reset the daily steps count
    // and Update the last day saved as the day changes.
    if (lastDaySaved! < todayDayNo) {
      lastDaySaved = todayDayNo;
      savedStepsCount = _steps;

      stepsBox
        ..put(lastDaySavedKey, lastDaySaved)
        ..put(savedStepsCountKey, savedStepsCount);
    }
    setState(() {
      _todaySteps = _steps - savedStepsCount!;
    });
    stepsBox.put(todayDayNo, _todaySteps);

    return _todaySteps;
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    if (kDebugMode) {
      print(event);
    }
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    if (kDebugMode) {
      print('onPedestrianStatusError: $error');
    }
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    if (kDebugMode) {
      print(_status);
    }
  }

  void onStepCountError(error) {
    if (kDebugMode) {
      print('onStepCountError: $error');
    }
    setState(() {});
  }

  void _onDone() => print("Finished pedometer tracking");

  Future<void> initPlatformState() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _stepCountStream = Pedometer.stepCountStream;
      _subscription = _stepCountStream.listen(onStepCount,
          onDone: _onDone, onError: onStepCountError, cancelOnError: true);
      _subscription;
      // _stepCountStream.listen(onStepCount).onError(onStepCountError);
      _pedestrianStatusStream
          .listen(onPedestrianStatusChanged)
          .onError(onPedestrianStatusError);

      if (kDebugMode) {
        print(_steps);
        print(_status);
      }
    } else {
      if (kDebugMode) {
        print('Tidak dibenarkan');
      }
    }
    // if (!mounted) return;
  }

  void stopCount() {
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: screenHeight * 0.07,
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
          flexibleSpace: ClipPath(
              //clipper: CustomShape(),
              child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 157, 228, 234),
          )),
          title: const Text(
            'Step Counter',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Steps taken at:',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _timeStamp.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
              const Text(
                'Steps taken:',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _todaySteps.toString(),
                style: const TextStyle(fontSize: 60),
              ),
              const Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
              const Text(
                'Pedestrian status:',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                        ? Icons.accessibility_new
                        : Icons.error,
                size: 100,
              ),
              Center(
                child: Text(
                  _status,
                  style: _status == 'walking' || _status == 'stopped'
                      ? const TextStyle(fontSize: 30)
                      : const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),
              // ElevatedButton(onPressed: () {}, child: Text('Start'))
            ],
          ),
        ),
      ),
    );
  }
}
