import 'package:flutter/material.dart';

class Service {
  IconData? icon;
  String? serviceName;
  Function? navigator;
  Service({this.icon, this.serviceName, this.navigator});
}

List<Service> services = [
  Service(
      serviceName: 'Health Status',
      icon: Icons.calendar_view_month,
      navigator: (context) {
        Navigator.pop(context);
      }),
  Service(
      serviceName: 'Book Appointment',
      icon: Icons.medication_outlined,
      navigator: (context) {
        Navigator.pop(context);
      }),
  Service(
      serviceName: 'Find Clinic',
      icon: Icons.list_alt,
      navigator: (context) {
        Navigator.pop(context);
      }),
  Service(
      serviceName: 'Teleconsulation',
      icon: Icons.text_snippet,
      navigator: (context) {
        Navigator.pop(context);
      }),
  Service(
      serviceName: 'Coming Soon',
      icon: Icons.list_alt,
      navigator: (context) {
        Navigator.pop(context);
      }),
  Service(
      serviceName: 'Coming Soon',
      icon: Icons.person,
      navigator: (context) {
        Navigator.pop(context);
      }),
];
