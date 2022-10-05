import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = 'https://staging.clinical.my/api/v1';

  Future userLogin(
      // String email,
      String nric,
      String password,
      String deviceName,
      String playerId) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final headerToken = storage.getString('token');
    final loginUserName = storage.getString('userName');

    final endpointLogin = Uri.parse('$baseUrl/login-nric');

    final body = {
      // 'email': email,
      'password': password,
      'nric': nric,
      'device_name': deviceName,
      'player_id': playerId
    };

    final response = await http.post(endpointLogin, body: body);
    print(response.statusCode);
    final responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      storage.setString('token', responseBody['token']['token']);
      storage.setString('userName', responseBody['user']['name']);
      // Get.snackbar('$loginUserName', '$headerToken');
      Get.toNamed('/loading');
    } else {
      Fluttertoast.showToast(
          msg: (responseBody['message']),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return json.decode(response.body);
  }

  Future fetchPanelList() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');

    final endpointPanelRecords = Uri.parse('$baseUrl/patient-records');
    final response = await http.get(endpointPanelRecords, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });

    final responseBody = json.decode(response.body)['data']['data'];

    return responseBody;
  }

  Future fetchPanelRecords(String orderId) async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');

    final endpointPanelRecords = Uri.parse('$baseUrl/patient-records/$orderId');
    final response = await http.get(endpointPanelRecords, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });

    final responseBody = json.decode(response.body)['data'];

    return responseBody;
  }
}
