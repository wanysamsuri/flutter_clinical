import 'package:flutter/material.dart';
import 'package:flutter_clinic/screens/appointment/appointment_screen.dart';

class AppointmentServiceModel {
  IconData? icon;
  String? serviceName;
  Function? navigator;
  AppointmentServiceModel({this.icon, this.serviceName, this.navigator});
}

List<AppointmentServiceModel> appointmentServices = [
  AppointmentServiceModel(
      serviceName: 'I DON\'T KNOW WHAT MY SICKNESS IS',
      icon: Icons.health_and_safety,
      navigator: (context) {
        Navigator.pop(context);
      }),
  AppointmentServiceModel(
      serviceName: 'CARDIOLOGY',
      icon: Icons.edit_calendar,
      navigator: () {
        print('object');
      }),
  AppointmentServiceModel(
      serviceName: 'EAR, NOSE AND THROAT',
      icon: Icons.search,
      navigator: (context) {
        Navigator.pop(context);
      }),
  AppointmentServiceModel(
      serviceName: 'INTERNAL MEDICINE',
      icon: Icons.co_present,
      navigator: (context) {
        Navigator.pop(context);
      }),
  AppointmentServiceModel(
      serviceName: 'DERMATOLOGY',
      icon: Icons.not_interested,
      navigator: (context) {
        Navigator.pop(context);
      }),
  AppointmentServiceModel(
      serviceName: 'PAEDIATRICS',
      icon: Icons.not_interested,
      navigator: (context) {
        Navigator.pop(context);
      }),
];
