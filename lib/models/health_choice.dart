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
      serviceName: 'Lifestyle',
      image: 'assets/healthy-lifestyle.png',
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthChoice(
      serviceName: 'Symptoms',
      image: 'assets/symptoms.png',
      navigator: (context) {
        Navigator.pop(context);
      }),
];
