import 'package:flutter/material.dart';
import 'package:flutter_clinic/screens/appointment/appointment_screen.dart';

class HealthChoice {
  String? image;
  String? serviceName;
  Function? navigator;
  HealthChoice({this.image, this.serviceName, this.navigator});
}

List<HealthChoice> healthChoice = [
  HealthChoice(
      serviceName: 'LIFESTYLE',
      image: 'assets/healthy-lifestyle.png',
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthChoice(
      serviceName: 'SYMPTOMS',
      image: 'assets/symptoms.png',
      navigator: (context) {
        Navigator.pop(context);
      }),
];
