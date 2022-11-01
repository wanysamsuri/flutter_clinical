import 'package:flutter/material.dart';
import 'package:flutter_clinic/screens/appointment/appointment_screen.dart';

class HealthStatus {
  IconData? icon;
  String? serviceName;
  Function? navigator;
  HealthStatus({this.icon, this.serviceName, this.navigator});
}

List<HealthStatus> healthStatus = [
  HealthStatus(
      serviceName: 'BLOOD PRESSURE',
      icon: Icons.medication,
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthStatus(
      serviceName: 'TEMPERATURE',
      icon: Icons.medication,
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthStatus(
      serviceName: 'WEIGHT & HEIGHT',
      icon: Icons.medication,
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthStatus(
      serviceName: 'MEDICAL HISTORY',
      icon: Icons.medication,
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthStatus(
      serviceName: 'SURGICAL HISTORY',
      icon: Icons.medication,
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthStatus(
      serviceName: 'ALLERGIC REACTION',
      icon: Icons.medication,
      navigator: (context) {
        Navigator.pop(context);
      }),
  HealthStatus(
      serviceName: 'SUGAR INTAKE',
      icon: Icons.medication,
      navigator: (context) {
        Navigator.pop(context);
      }),
];
