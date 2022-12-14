import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clinic/screens/auth/kyc_email.dart';
import 'package:flutter_clinic/utils/get_device.dart';
import 'package:flutter_clinic/utils/get_player_id.dart';
import 'package:flutter_clinic/utils/get_sharedprefs.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? sharedFullName;

String? sharedEmail;
String? sharedNric;
String? sharedPhoneNum;
String? sharedToken;
String? sharedDeviceName;
String? sharedPlayerIdOneSignal;

class LoadingScreens extends StatefulWidget {
  const LoadingScreens({Key? key}) : super(key: key);
  @override
  State<LoadingScreens> createState() => _LoadingScreensState();
}

class _LoadingScreensState extends State<LoadingScreens> {
  // static const String oneSignalAppId = "8ccd5fa1-7218-4f73-bfea-bd84b99bb016";

  @override
  void initState() {
    super.initState();
    GetDeviceInfo().getModelDetails();
    Future.delayed(Duration(seconds: 3), () {
      _loadUserInfo();
    });
    // SharedPrefsStorage().refreshStorage();

    // configOneSignel();
  }

  _loadUserInfo() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    // storage.clear();
    // storage.reload();
    sharedToken = storage.getString('token');
    sharedFullName = storage.getString('userName');
    sharedEmail = storage.getString('userEmail');
    sharedNric = storage.getString('_userNric');
    sharedPhoneNum = storage.getString('userPhoneNumber');
    sharedDeviceName = storage.getString('modelPhone');
    sharedPlayerIdOneSignal = storage.getString('playerIdOneSignal');

    print('this is from loading device name : $sharedDeviceName');
    print('this is from loading token : $sharedToken');
    print('this is from loading player id : $sharedPlayerIdOneSignal');

    if (sharedToken == null) {
      print('token if null : $sharedToken');
      print('token if null, mounted?: $mounted');
      Get.offAllNamed('/welcome');
      // Navigator.pushNamedAndRemoveUntil(
      //     context, '/signin_page', (route) => false);
    } else {
      print('token if not null : $sharedToken');
      print('token if not null, mounted?: $mounted');
      // Get.off(()=>EmailVerification());
      Get.offAllNamed('/dashboard');
      // Navigator.pushNamedAndRemoveUntil(
      //     context, '/dashboard', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/Clinical-Logo-White.png',
                  width: 300,
                ),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        ));
  }
}
