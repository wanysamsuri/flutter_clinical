import 'package:flutter/material.dart';
import 'package:flutter_clinic/screens/appointment/appointment_screen.dart';

class StepCounterDataModel {
  String? label;
  String? date;
  String? step;
  StepCounterDataModel({this.date, this.step, this.label});
}

List<StepCounterDataModel> stepCounterData = [
  StepCounterDataModel(step: '200', date: '17/12/2022', label: 'fun walk'),
  StepCounterDataModel(
      step: '1281', date: '18/12/2022', label: 'not so fun walk'),
  StepCounterDataModel(
    step: '5345',
    date: '19/12/2022',
    label: 'okay fun walk',
  ),
  StepCounterDataModel(step: '10000', date: '20/12/2022', label: 'fun walk'),
  StepCounterDataModel(step: '53', date: '21/12/2022', label: 'fun walk'),
  StepCounterDataModel(step: '5454', date: '22/12/2022', label: 'fun walk'),
];
