import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clinic/screens/auth/kyc_email.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? sharedFullName;
String? sharedDeviceName;
String? sharedEmail;
String? sharedNric;
String? sharedPhoneNum;
String? sharedToken;
String? sharedPlayerIdOneSignal;

class LoadingScreens extends StatefulWidget {
  const LoadingScreens({Key? key}) : super(key: key);
  @override
  State<LoadingScreens> createState() => _LoadingScreensState();
}

class _LoadingScreensState extends State<LoadingScreens> {
  @override
  void initState() {
    super.initState();
    getModelDetails();
    setState(() {
      Future.delayed(Duration(seconds: 2), () {
        _loadUserInfo();
      });
      initPlatformState();

      // configOneSignel();
    });
  }

  _loadUserInfo() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    // storage.clear();
    await storage.reload();
    sharedToken = storage.getString('token');
    sharedFullName = storage.getString('userName');
    sharedDeviceName = storage.getString('modelPhone');
    sharedEmail = storage.getString('_userEmail');
    sharedNric = storage.getString('_userNric');
    sharedPhoneNum = storage.getString('_userPhoneNumber');
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

  static const String oneSignalAppId = "8ccd5fa1-7218-4f73-bfea-bd84b99bb016";
  void configOneSignel() {
    OneSignal.shared.setAppId('8ccd5fa1-7218-4f73-bfea-bd84b99bb016');
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

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<void> getModelDetails() async {
    var deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('modelPhone', deviceData['model']);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('modelPhone', deviceData['model']);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;
    setState(() {});
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'device': build.device,
      'display': build.display,
      'model': build.model,
    };
  }

  Future<void> initPlatformState() async {
    OneSignal.shared.setAppId(oneSignalAppId);
    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    SharedPreferences storage = await SharedPreferences.getInstance();

    final status = await OneSignal.shared.getDeviceState();
    String? osUserID = status?.userId;
    await storage.setString('playerIdOneSignal', osUserID ?? '');
    print('Player ID: ' '$osUserID');

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification
      event.complete(event.notification);
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // Will be called whenever a notification is opened/button pressed.
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      // Will be called whenever the permission changes
      // (ie. user taps Allow on the permission prompt in iOS)
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      // Will be called whenever the subscription changes
      // (ie. user gets registered with OneSignal and gets a user ID)
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges emailChanges) {
      // Will be called whenever then user's email subscription changes
      // (ie. OneSignal.setEmail(email) is called and the user gets registered
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) async {});
  }
}
