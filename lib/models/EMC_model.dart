import 'package:flutter/material.dart';

class EMCModel {
  String clinic;
  String patient;

  EMCModel({required this.clinic, required this.patient});
}

List<EMCModel> appointmentServices = [
  EMCModel(
    clinic: 'POLIKLINIK DR. HANAFI',
    patient: 'Patient Name',
  ),
  EMCModel(
    clinic: 'POLIKLINIK DR. HANAFI',
    patient: 'Patient Name',
  ),
  EMCModel(
    clinic: 'POLIKLINIK DR. HANAFI',
    patient: 'Patient Name',
  ),
  EMCModel(
    clinic: 'POLIKLINIK DR. HANAFI',
    patient: 'Patient Name',
  )
];
