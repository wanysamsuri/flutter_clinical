import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../customshape.dart';
import '../../services/api_service.dart';

class FindClinicScreen extends StatefulWidget {
  const FindClinicScreen(void currentLocation,
      // void currentLocation,
      {Key? key})
      : super(key: key);

  @override
  State<FindClinicScreen> createState() => _FindClinicScreenState();
}

// late String? lat = '';
// late String? long = '';
String? lat = '';
String? long = '';
String? locationMessage = "";

class _FindClinicScreenState extends State<FindClinicScreen> {
  // var lat;
  // var long;

  // var locationMessage = "";
  // void getCurrentLocation() async {
  //   LocationPermission permission;
  //   permission = await Geolocator.requestPermission();
  //   var position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   var lastPosition = await Geolocator.getLastKnownPosition();
  //   print(lastPosition);
  //   lat = position.latitude.toString();
  //   long = position.longitude.toString();
  //   print('$lat, $long');

  //   setState(() {
  //     lat = position.latitude.toString();
  //     long = position.longitude.toString();
  //     locationMessage = '$position';
  //   });
  // }
  void getCurrentLocation() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    await storage.setString('latitude', '${position.latitude.toString()}');
    await storage.setString('longitude', '${position.longitude.toString()}');
    lat = position.latitude.toString();
    long = position.longitude.toString();
    print('$lat, $long');

    setState(() {
      lat = position.latitude.toString();
      long = position.longitude.toString();
      locationMessage = '$position';
    });
  }

  // Future fetchPanels(
  //     // String latitude, String longitude
  //     ) async {
  //   SharedPreferences storage = await SharedPreferences.getInstance();
  //   getCurrentLocation();
  //   final headerToken = storage.getString('token');
  //   final latitude = storage.getString('latitude');
  //   final longitude = storage.getString('longitude');
  //   final endpointPanel = Uri.parse(
  //     'https://staging.clinical.my/api/v1/panels?latitude=$latitude&longitude=$longitude',
  //   );
  //   final response = await http.get(
  //     endpointPanel,
  //     headers: {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $headerToken'
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     // getCurrentLocation();
  //     final responseBody = json.decode(response.body)['data'];
  //     return responseBody;
  //   } else if (response.statusCode == 401) {
  //     await storage.clear();
  //     Get.offAllNamed('/loading');
  //   }

  //   // final responseBody = json.decode(response.body)['data'];
  //   // return responseBody;
  // }

  Future? futurefetchPanels;
  int selected = -1;
  @override
  void initState() {
    // TODO: implement initState
    // getCurrentLocation();
    futurefetchPanels = ApiService().fetchPanels(lat!,long!);
    print('this is latitude : $lat');
    super.initState();
  }

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: screenHeight * 0.07,
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
          flexibleSpace: ClipPath(
              // clipper: CustomShape(),
              child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 157, 228, 234),
          )),
          title: const Text(
            'Find Clinics',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )),
      body: Container(
        padding: EdgeInsets.all(Adaptive.w(2)),
        height: 130.h,
        child: SafeArea(
          child: FutureBuilder(
            future: futurefetchPanels,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.all(Adaptive.w(2)),
                  height: 130.h,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                prefixIcon: Icon(Icons.search),
                                labelText: 'Search',
                                border: InputBorder.none),
                          ),
                        ),
                        // Container(
                        //   padding: EdgeInsets.all(20),
                        //   child: const Text(
                        //     "Show in map",
                        //     style: TextStyle(
                        //         fontSize: 18,
                        //         color: Colors.blue,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        SizedBox(
                          height: Adaptive.h(2),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          child: const Text(
                            "Nearby clinics are as below:",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.0, vertical: 5),

                                  //body listview
                                  child: InkWell(
                                    child: Container(
                                      padding: EdgeInsets.all(Adaptive.h(2)),
                                      height: Adaptive.h(12),
                                      decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  child: Text(
                                                snapshot.data['data'][index]
                                                    ['name'],
                                                style: TextStyle(
                                                    fontSize: 0.29.dp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              // SizedBox(
                                              //   width: Adaptive.w(10),
                                              // ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: RichText(
                                                  text: TextSpan(
                                                      text: snapshot
                                                          .data['data'][index]
                                                              ['distance']
                                                          .toStringAsFixed(1),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 0.3.dp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text: ' km',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ]),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: Adaptive.h(1),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: RichText(
                                                  text: TextSpan(
                                                      text:
                                                          snapshot.data['data']
                                                              [index]['city'],
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 0.25.dp,
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(text: (', ')),
                                                        TextSpan(
                                                          text: snapshot.data[
                                                                  'data'][index]
                                                              ['postcode'],
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(
                                            20,
                                          ))),
                                          builder: ((context) => Container(
                                                padding: EdgeInsets.all(
                                                    Adaptive.h(2)),
                                                height: Adaptive.h(40),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                            child: Text(
                                                          snapshot.data['data']
                                                              [index]['name'],
                                                          style: TextStyle(
                                                              fontSize: 0.29.dp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                        // SizedBox(
                                                        //   width: Adaptive.w(10),
                                                        // ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: RichText(
                                                            text: TextSpan(
                                                                text: snapshot
                                                                    .data['data']
                                                                        [index][
                                                                        'distance']
                                                                    .toStringAsFixed(
                                                                        1),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        0.3.dp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                children: <
                                                                    TextSpan>[
                                                                  TextSpan(
                                                                      text:
                                                                          ' km',
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                ]),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: Adaptive.h(1),
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                            width:
                                                                Adaptive.w(90),
                                                            child: Text(
                                                              snapshot.data[
                                                                          'data']
                                                                      [index]
                                                                  ['address'],
                                                              maxLines: 5,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      0.25.dp),
                                                            )),
                                                        Container(
                                                            width:
                                                                Adaptive.w(90),
                                                            child: RichText(
                                                                text: TextSpan(
                                                                    text: snapshot.data['data']
                                                                            [
                                                                            index]
                                                                        [
                                                                        'city'],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            0.25
                                                                                .dp,
                                                                        color: Colors
                                                                            .black),
                                                                    children: <
                                                                        TextSpan>[
                                                                  TextSpan(
                                                                      text:
                                                                          (', ')),
                                                                  TextSpan(
                                                                    text: snapshot.data['data']
                                                                            [
                                                                            index]
                                                                        [
                                                                        'postcode'],
                                                                  ),
                                                                ]))),
                                                        Container(
                                                            width:
                                                                Adaptive.w(90),
                                                            child: Text(
                                                              snapshot.data[
                                                                          'data']
                                                                      [index]
                                                                  ['website'],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontSize:
                                                                      0.25.dp),
                                                            )),
                                                        SizedBox(
                                                          height: Adaptive.h(5),
                                                        ),
                                                        Text(locationMessage!),
                                                        InkWell(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            // width: Adaptive.w(
                                                            // 50),
                                                            // height:
                                                            //     Adaptive.h(5),
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    primaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child: Center(
                                                                child: Text(
                                                              'Get Location',
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            )),
                                                          ),
                                                          onTap: () {
                                                            // getCurrentLocation();
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )));
                                    },
                                  ),
                                );
                              }),
                        ),
                      ]),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}

//   Text(
//     'Show in map',
//     style: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//         color: Colors.blue),
//   ),
//   SizedBox(
//     height: 30,
//   ),
//   Container(
//     padding: EdgeInsets.symmetric(horizontal: 10),
//     decoration: BoxDecoration(
//       color: secondaryColor,
//       // borderRadius: BorderRadius.circular(20)
//     ),
//     child: TextField(
//       enabled: false,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.only(left: 10),
//           labelText: 'Poliklinik Dr Hanafi',
//           labelStyle: TextStyle(color: Colors.black),
//           border: InputBorder.none),
//     ),
//   ),
//   SizedBox(
//     height: 10,
//   ),
//   Container(
//     padding: EdgeInsets.symmetric(horizontal: 10),
//     decoration: BoxDecoration(
//       color: secondaryColor,
//       // borderRadius: BorderRadius.circular(20)
//     ),
//     child: TextField(
//       enabled: false,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.only(left: 10),
//           labelText: 'Poliklinik Dr Hanafi',
//           labelStyle: TextStyle(color: Colors.black),
//           border: InputBorder.none),
//     ),
//   ),
//   SizedBox(
//     height: 10,
//   ),
//   Container(
//     padding: EdgeInsets.symmetric(horizontal: 10),
//     decoration: BoxDecoration(
//       color: secondaryColor,
//       // borderRadius: BorderRadius.circular(20)
//     ),
//     child: TextField(
//       enabled: false,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.only(left: 10),
//           labelText: 'Poliklinik Dr Hanafi',
//           labelStyle: TextStyle(color: Colors.black),
//           border: InputBorder.none),
//     ),
//   ),
//   SizedBox(
//     height: 10,
//   ),
//   Container(
//     padding: EdgeInsets.symmetric(horizontal: 10),
//     decoration: BoxDecoration(
//       color: secondaryColor,
//       // borderRadius: BorderRadius.circular(20)
//     ),
//     child: TextField(
//       enabled: false,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.only(left: 10),
//           labelText: 'Poliklinik Dr Hanafi',
//           labelStyle: TextStyle(color: Colors.black),
//           border: InputBorder.none),
//     ),
//   ),
// ]))),
