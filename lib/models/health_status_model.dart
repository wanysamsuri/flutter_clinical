import 'package:flutter/material.dart';
import 'package:flutter_clinic/screens/appointment/appointment_screen.dart';

class HealthStatus {
  String? image;
  String? serviceName;
  Function? navigator;
  HealthStatus({this.image, this.serviceName, this.navigator});
}

List<HealthStatus> healthStatus = [
  HealthStatus(
      serviceName: 'BLOOD PRESSURE',
      image: 'assets/blood_pressure.png',
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthStatus(
      serviceName: 'TEMPERATURE',
      image: 'assets/thermometer.png',
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthStatus(
      serviceName: 'WEIGHT & HEIGHT',
      image: 'assets/height.png',
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthStatus(
      serviceName: 'MEDICAL HISTORY',
      image: 'assets/questions.png',
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthStatus(
      serviceName: 'SURGICAL HISTORY',
      image: 'assets/surgery-room.png',
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthStatus(
      serviceName: 'ALLERGIC REACTION',
      image: 'assets/dust.png',
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthStatus(
      serviceName: 'SUGAR BLOOD LEVEL',
      image: 'assets/sugar-blood-level.png',
      navigator: (context) {
        Navigator.pop(context);
      }),
];
