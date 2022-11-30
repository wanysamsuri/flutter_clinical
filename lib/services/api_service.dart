import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clinic/screens/auth/kyc_email.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
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

    final response = await http.post(endpointLogin,
        headers: {
          'Accept': 'application/json',
        },
        body: body);
    print(response.statusCode);
    final responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      storage.setString('token', responseBody['token']['token']);
      storage.setString('userName', responseBody['user']['name']);
      // Get.snackbar('$loginUserName', '$headerToken');
      // Get.toNamed('/loading');
      Get.offAll(() => LoadingScreens());
      // Get.to(() => EmailVerification());
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
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data']['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }
  }

  Future fetchPanelRecords(String orderId) async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');

    final endpointPanelRecords = Uri.parse('$baseUrl/patient-records/$orderId');
    final response = await http.get(endpointPanelRecords, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }

    // final responseBody = json.decode(response.body)['data'];
    // return responseBody;
  }

  Future userLogout(
      // String email,
      ) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final headerToken = storage.getString('token');
    final loginUserName = storage.getString('userName');

    final endpointLogout = Uri.parse('$baseUrl/logout');

    final response = await http.get(endpointLogout, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });
    print(response.statusCode);
    final responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      // storage.setString('token', responseBody['token']['token']);
      // storage.setString('userName', responseBody['user']['name']);
      // Get.snackbar('$loginUserName', '$headerToken');
      storage.clear();
      Fluttertoast.showToast(
          msg: (responseBody['message']),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      Get.toNamed('/loading');
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    } else {
      Fluttertoast.showToast(
          msg: (responseBody['message']),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Get.toNamed('/loading');
    }

    return json.decode(response.body);
  }

  Future fetchUserProfile() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');
    final endpointUserProfile = Uri.parse('$baseUrl/profile');
    final response = await http.get(endpointUserProfile, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }

    // final responseBody = json.decode(response.body)['data'];
    // return responseBody;
  }

  Future fetchDeviceName() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');
    final endpointDeviceName = Uri.parse('$baseUrl/personal-access-tokens');
    final response = await http.get(endpointDeviceName, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }

    // final responseBody = json.decode(response.body)['data'];
    // return responseBody;
  }

  Future fetchNotification() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');
    final endpointMessage = Uri.parse('$baseUrl/notifications');
    final response = await http.get(endpointMessage, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }
    // final responseBody = json.decode(response.body)['data'];

    // final responseBody = json.decode(response.body)['data'];

    // return responseBody;
  }

  Future deleteDevice(String deviceId) async {
    String id;

    SharedPreferences storage = await SharedPreferences.getInstance();
    final headerToken = storage.getString('token');
    final deviceName = storage.getString('name');

    final endpointDelete =
        Uri.parse('$baseUrl/personal-access-tokens/$deviceId/delete');

    final body = {
      'id': deviceName,
    };

    final response = await http.post(endpointDelete, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });
    print(response.statusCode);
    final responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      // storage.clear();
      Fluttertoast.showToast(
          msg: (responseBody['message']),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      // Get.toNamed('/loading');
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

  Future fetchHighlightIndex() async {}
  Future fetchFAQ() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');
    final endpointPanel = Uri.parse('$baseUrl/faq');
    final response = await http.get(endpointPanel, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }

    // final responseBody = json.decode(response.body)['data'];
    // return responseBody;
  }

  Future fetchHighlight() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final headerToken = storage.getString('token');
    final endpointHighlight = Uri.parse(
      '$baseUrl/articles/highlight',
    );
    final response = await http.get(
      endpointHighlight,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $headerToken'
      },
    );
    print('Highlight Index:${response.statusCode}');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }
  }

  Future fetchArticleIndex() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final headerToken = storage.getString('token');
    final endpointHighlight = Uri.parse(
      '$baseUrl/articles/',
    );
    final response = await http.get(
      endpointHighlight,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $headerToken'
      },
    );
    print('Article Index : ${response.statusCode}');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data']['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }
  }

  Future fetchArticleShow(String id) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final headerToken = storage.getString('token');
    final endpointHighlight = Uri.parse(
      '$baseUrl/articles/$id',
    );
    final response = await http.get(
      endpointHighlight,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $headerToken'
      },
    );
    print('Highlight Show : ${response.statusCode}');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }
  }

  Future fetchPanels(
      // String latitude, String longitude
      ) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    }
    var position = await Geolocator.getCurrentPosition();
    // desiredAccuracy: LocationAccuracy.high);
    var lastPosition = Geolocator.getLastKnownPosition();
    print(lastPosition);
    storage.setString('latitude', position.latitude.toString());
    storage.setString('longitude', position.longitude.toString());
    final latitude = await storage.getString('latitude');
    final longitude = await storage.getString('longitude');
    final headerToken = storage.getString('token');
    final endpointPanel = Uri.parse(
      '$baseUrl/panels?latitude=$latitude&longitude=$longitude',
    );
    final response = await http.get(
      endpointPanel,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $headerToken'
      },
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }

    // final responseBody = json.decode(response.body)['data'];
    // return responseBody;
  }

  Future postUpdatePassword(
      String oldPass, String newPass, String newPassConfirm) async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');

    final endpointHighlight = Uri.parse('$baseUrl/update-password');
    final changePasswordBody = {
      'old_password': oldPass,
      'password': newPass,
      'password_confirmation': newPassConfirm
    };
    final response = await http.post(endpointHighlight,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $headerToken'
        },
        body: changePasswordBody);
    final responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      print(responseBody['message']);
      if (responseBody['success'] == false) {
        Fluttertoast.showToast(
            msg: (responseBody['message']),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: (responseBody['message']),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 16.0);
        Get.back();
        return responseBody;
      }
    } else {
      await storage.clear();
      Get.offAllNamed('/loading');
    }
  }

  Future postResetPassword(String email) async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');

    final endpointResetPassword = Uri.parse('$baseUrl/password/reset');
    final resetPasswordBody = {
      'email': email,
    };
    final response = await http.post(endpointResetPassword,
        headers: {
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $headerToken'
        },
        body: resetPasswordBody);
    final responseBody = json.decode(response.body);
    print(response.statusCode);

    if (response.statusCode == 201) {
      print(responseBody['message']);
      Fluttertoast.showToast(
          msg: (responseBody['message']),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Color.fromRGBO(255, 255, 255, 1),
          fontSize: 16.0);
      return responseBody;

      // Get.toNamed('/loading');
    } else if (response.statusCode == 401) {
      print(responseBody['message']);
    }
    // } else {
    //   Fluttertoast.showToast(
    //       msg: (responseBody['message']),
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Color.fromRGBO(255, 255, 255, 1),
    //       fontSize: 16.0);
    //   // await storage.clear();
    //   // Get.offAllNamed('/loading');
    // }
    else {
      print('tak tau apa jadi');
    }

    // final responseBody = json.decode(response.body)['data'];
  }
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }

  //   return json.decode(response.body);
  // }

  //feedback

  Future userFeedback(
    String feedbackMessage,
  ) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final headerToken = storage.getString('token');
    // final feedbackMessage = storage.getString('feedback');

    final endpointFeedback = Uri.parse('$baseUrl/feedbacks');

    final body = {
      'message': feedbackMessage,
    };

    final response = await http.post(endpointFeedback,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $headerToken'
        },
        body: body);
    print(response.statusCode);
    print(body);
    final responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: (responseBody['message']),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future fetchUserStrava() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');
    final endpointUserStrava = Uri.parse('$baseUrl/stravas/profile');
    final response = await http.get(endpointUserStrava, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }
  }

  Future fetchStravaActivity() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');
    final endpointActivity = Uri.parse('$baseUrl/stravas');
    final response = await http.get(endpointActivity, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }
  }

  Future fetchStravaSync() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');
    final endpointSync = Uri.parse('$baseUrl/stravas/sync-activities');
    final response = await http.get(endpointSync, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }
  }

  Future fetchSalixium() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');
    final endpointSalixium = Uri.parse('$baseUrl/salixium');
    final response = await http.get(endpointSalixium, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }
  }

  Future fetchSalixiumSync() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');
    final endpointSalixiumSync = Uri.parse('$baseUrl/salixium/sync');
    final response = await http.get(endpointSalixiumSync, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });
    final responseBody = json.decode(response.body);

    // if
    // (response.statusCode == 200) {
    //   // final responseBody = json.decode(response.body);
    //   Fluttertoast.showToast(
    //       msg: (responseBody['message']),
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    // } else
    if (response.statusCode == 401) {
      Fluttertoast.showToast(
          msg: (responseBody['message']),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      await storage.clear();
      Get.offAllNamed('/loading');
    }
    // else {
    //   // final responseBody = json.decode(response.body);
    //   Fluttertoast.showToast(
    //       msg: (responseBody['message']),
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    // }
    return responseBody;
  }

  Future fetchSelfTest() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');
    final endpointSelfTest = Uri.parse('$baseUrl/self-tests');
    final response = await http.get(endpointSelfTest, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }
  }

  Future fetchClinicTest() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final headerToken = storage.getString('token');
    final endpointSelfTest = Uri.parse('$baseUrl/tests');
    final response = await http.get(endpointSelfTest, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $headerToken'
    });

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body)['data'];
      return responseBody;
    } else if (response.statusCode == 401) {
      await storage.clear();
      Get.offAllNamed('/loading');
    }
  }

  Future userTestResult(
    String name,
    String type,
    String result,
    String remarks,
  ) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final headerToken = storage.getString('token');
    // final feedbackMessage = storage.getString('feedback');

    final endpointTestResult = Uri.parse('$baseUrl/tests');

    final body = {
      'name': name,
      'type': type,
      'result': result,
      'remarks': remarks,
    };

    final response = await http.post(endpointTestResult,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $headerToken'
        },
        body: body);
    print(response.statusCode);
    print(body);
    final responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: (responseBody['message']),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future userRegister(
    String name,
    String nric,
    String email,
    String phone,
    String password,
  ) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final headerToken = storage.getString('token');
    // final feedbackMessage = storage.getString('feedback');

    final endpointRegister = Uri.parse('$baseUrl/register');

    final body = {
      'name': name,
      'nric': nric,
      'email': email,
      'phone': phone,
      'password': password,
    };

    final response = await http.post(endpointRegister,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $headerToken'
        },
        body: body);
    print(response.statusCode);
    print(body);
    final responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: (responseBody['message']),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
