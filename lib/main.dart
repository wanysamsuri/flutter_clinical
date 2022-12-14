import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clinic/record_screen.dart';
import 'package:flutter_clinic/screens/appointment/queue_new.dart';
import 'package:flutter_clinic/screens/auth/kyc_email.dart';
import 'package:flutter_clinic/screens/auth/signin_page.dart';
import 'package:flutter_clinic/screens/auth/signup_page.dart';
import 'package:flutter_clinic/screens/home_screen.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:flutter_clinic/screens/health%20record/panel_records.dart';
import 'package:flutter_clinic/screens/notification/no_noti_screens.dart';
import 'package:flutter_clinic/screens/notification/noti_screens.dart';
import 'package:flutter_clinic/screens/profile/connected_device.dart';
import 'package:flutter_clinic/screens/profile/feedback.dart';
import 'package:flutter_clinic/screens/profile/help_faq.dart';
import 'package:flutter_clinic/screens/profile/patient_profile.dart';
import 'package:flutter_clinic/screens/profile/terms_condition.dart';
import 'package:flutter_clinic/screens/welcome_page.dart';
import 'package:flutter_clinic/dashboard.dart';
import 'package:flutter_clinic/services/api_service.dart';
import 'package:flutter_clinic/utils/get_device.dart';
import 'package:flutter_clinic/utils/get_player_id.dart';
import 'package:flutter_clinic/utils/get_sharedprefs.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    SharedPrefsStorage().refreshStorage();
    PlayerId().getPlayerId();
    // GetDeviceInfo().getModelDetails();

    // configOneSignal();
  }

  // static const String oneSignalAppId = "8ccd5fa1-7218-4f73-bfea-bd84b99bb016";
  // void configOneSignal() {
  //   OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  //   OneSignal.shared.setAppId(oneSignalAppId);
  //   OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
  //     print('accepted permission: $accepted');
  //   });
  //   OneSignal.shared.postNotificationWithJson({'notification': 'hello'});
  // }

  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
          title: 'Clinical',
          debugShowCheckedModeBanner: false,
          routes: {
            '/loading': ((context) => const LoadingScreens()),
            '/profile': ((context) => const PatientProfileScreen()),
            '/feedback': ((context) => const FeedbackScreen()),
            '/terms': ((context) => const TermsConditionScreen()),
            '/help': ((context) => const HelpScreen()),
            '/welcome': ((context) => const Welcome()),
            '/homepage_page': ((context) => const HomeScreen()),
            '/signin_page': ((context) => const SignIn()),
            '/signup_page': ((context) => const SignUp()),
            // '/record_screen': ((context) =>  HealthRecord()),
            '/panel_records': ((context) => const PanelRecords()),
            '/dashboard': ((context) => const Dashboard()),
            '/queue_new': ((context) => const QueueNew()),
            '/noNoti': ((context) => const NoNotiScreens()),
            '/device': ((context) => const ConnectedDevicesScreens()),
            // '/notification': ((context) =>  NotificationScreen()),
            '/kyc_email': ((context) => const EmailVerification()),
          },
          initialRoute: '/loading',
          );
    });
  }

//   Future<void> initPlatformState() async {
//     OneSignal.shared.setAppId(oneSignalAppId);
//     //Remove this method to stop OneSignal Debugging
//     OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

// // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//     OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
//       print("Accepted permission: $accepted");
//     });

//     OneSignal.shared.setNotificationWillShowInForegroundHandler(
//         (OSNotificationReceivedEvent event) {
//       // Will be called whenever a notification is received in foreground
//       // Display Notification, pass null param for not displaying the notification
//       event.complete(event.notification);
//     });

//     OneSignal.shared
//         .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
//       // Will be called whenever a notification is opened/button pressed.
//     });

//     OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
//       // Will be called whenever the permission changes
//       // (ie. user taps Allow on the permission prompt in iOS)
//     });

//     OneSignal.shared
//         .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
//       // Will be called whenever the subscription changes
//       // (ie. user gets registered with OneSignal and gets a user ID)
//     });

//     OneSignal.shared.setEmailSubscriptionObserver(
//         (OSEmailSubscriptionStateChanges emailChanges) {
//       // Will be called whenever then user's email subscription changes
//       // (ie. OneSignal.setEmail(email) is called and the user gets registered
//     });

//     OneSignal.shared
//         .setSubscriptionObserver((OSSubscriptionStateChanges changes) async {
//       SharedPreferences storage = await SharedPreferences.getInstance();

//       final status = await OneSignal.shared.getDeviceState();
//       String? osUserID = status!.userId;
//       storage.setString('playerIdOneSignal', osUserID ?? '');
//       print('Player ID:  $osUserID');
//     });
//   }

}
