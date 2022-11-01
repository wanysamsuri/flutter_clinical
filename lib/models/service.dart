import 'package:flutter/material.dart';
import 'package:flutter_clinic/screens/appointment/appointment_screen.dart';

class Service {
  IconData? icon;
  String? serviceName;
  Function? navigator;
  Service({this.icon, this.serviceName, this.navigator});
}

List<Service> services = [
  Service(
      serviceName: 'Body Mass Index',
      icon: Icons.scale,
      navigator: (context) {
        Navigator.pop(context);
      }),
  Service(
      serviceName: 'Book Appointment',
      icon: Icons.edit_calendar,
      navigator: () {
        print('object');
      }),
  Service(
      serviceName: 'Find Clinic',
      icon: Icons.search,
      navigator: (context) {
        Navigator.pop(context);
      }),
  Service(
      serviceName: 'Health Status',
      icon: Icons.bloodtype,
      navigator: (context) {
        Navigator.pop(context);
      }),
      
  // Service(
  //     serviceName: 'Coming Soon',
  //     icon: Icons.not_interested,
  //     navigator: (context) {
  //       Navigator.pop(context);
  //     }),
  // Service(
  //     serviceName: 'Coming Soon',
  //     icon: Icons.not_interested,
  //     navigator: (context) {
  //       Navigator.pop(context);
  //     }),
];
