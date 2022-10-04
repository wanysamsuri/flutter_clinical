import 'package:flutter/material.dart';

class NewAppointment {
  String? clinic;
  String? name;
  String? date;
  String? time;
  Function? navigator;

  NewAppointment(
      {this.clinic, this.name, this.date, this.time, this.navigator});
}

List<NewAppointment> newAppointment = [
  NewAppointment(
      clinic: 'Poliklinik Dr Hanafi',
      name: 'nama',
      date: 'date',
      time: 'time',
      navigator: (context) {
        Navigator.pop(context);
      }),
  NewAppointment(
      clinic: 'Poliklinik Dr Hanafi',
      name: 'nama',
      date: 'date',
      time: 'time',
      navigator: (context) {
        Navigator.pop(context);
      }),
  NewAppointment(
      clinic: 'Poliklinik Dr Hanafi',
      name: 'nama',
      date: 'date',
      time: 'time',
      navigator: (context) {
        Navigator.pop(context);
      }),
  NewAppointment(
      clinic: 'Poliklinik Dr Hanafi',
      name: 'nama',
      date: 'date',
      time: 'time',
      navigator: (context) {
        Navigator.pop(context);
      }),
  NewAppointment(
      clinic: 'Poliklinik Dr Hanafi',
      name: 'nama',
      date: 'date',
      time: 'time',
      navigator: (context) {
        Navigator.pop(context);
      }),
  NewAppointment(
      clinic: 'Poliklinik Dr Hanafi',
      name: 'nama',
      date: 'date',
      time: 'time',
      navigator: (context) {
        Navigator.pop(context);
      }),
];
