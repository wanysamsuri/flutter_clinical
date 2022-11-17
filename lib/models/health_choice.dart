import 'package:flutter/material.dart';
import 'package:flutter_clinic/screens/appointment/appointment_screen.dart';

class HealthChoice {
  IconData? icon;
  String? serviceName;
  Function? navigator;
  HealthChoice({this.icon, this.serviceName, this.navigator});
}

List<HealthChoice> healthChoice = [
  HealthChoice(
      serviceName: 'Lifestyle',
      icon: Icons.medication,
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthChoice(
      serviceName: 'Symptoms',
      icon: Icons.medication,
      navigator: (context) {
        Navigator.pop(context);
      }),
];
