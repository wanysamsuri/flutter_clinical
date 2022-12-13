import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/health%20status/view_status.dart';
import 'package:flutter_clinic/screens/home_screen.dart';
import 'package:flutter_clinic/screens/profile/terms_condition.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant.dart';
import '../record_screen.dart';
import '../screens/profile/edit_password.dart';
import '../screens/profile/edit_profile.dart';
import '../services/api_service.dart';

class StravaActivityScreen extends StatefulWidget {
  const StravaActivityScreen({Key? key, required String serviceName})
      : super(key: key);

  @override
  State<StravaActivityScreen> createState() => _StravaActivityScreenState();
}

class _StravaActivityScreenState extends State<StravaActivityScreen> {
  Future? futureFetchStravaActivity;
  @override
  void initState() {
    // TODO: implement initState
    futureFetchStravaActivity = ApiService().fetchStravaActivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //     automaticallyImplyLeading: false,
      //     toolbarHeight: screenHeight * 0.07,
      //     backgroundColor: Colors.grey[50],
      //     elevation: 0.0,
      //     flexibleSpace: ClipPath(
      //         //clipper: CustomShape(),
      //         child: Container(
      //       height: 200,
      //       width: MediaQuery.of(context).size.width,
      //       color: Color.fromARGB(255, 157, 228, 234),
      //     )),
      //     title: const Text(
      //       'STRAVA',
      //       style: TextStyle(color: Colors.black),
      //     ),
      //     centerTitle: true,
      //     leading: GestureDetector(
      //       child: const Icon(
      //         Icons.arrow_back_ios,
      //         color: Colors.black,
      //       ),
      //       onTap: () {
      //         Navigator.pop(context);
      //         Navigator.pop(context);
      //       },
      //     )),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                // padding: EdgeInsets.all(50),
                // width: Adaptive.w(12),
                // height: Adaptive.h(20),
                // color: Colors.amber,
                child: Column(
                  children: [
                    Container(
                      child: FutureBuilder(
                          future: futureFetchStravaActivity,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  // gridDelegate:
                                  //     SliverGridDelegateWithFixedCrossAxisCount(
                                  //         crossAxisCount: 2),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Container(
                                        // height: Adaptive.h(20),
                                        width: Adaptive.w(20),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot.data[index]['name']
                                                        .toString()
                                                        .toUpperCase(),
                                                    // overflow: TextOverflow.ellipsis,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: Adaptive.h(1),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Icon(
                                                          Icons.route_rounded,
                                                          size: 20,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          snapshot.data[index]
                                                                  ['type']
                                                              .toString()
                                                              .toUpperCase(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          // style: TextStyle(
                                                          //     fontWeight:
                                                          //         FontWeight.bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Divider(
                                                    thickness: 2,
                                                    // color: Colors.black,
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Distance',
                                                          textAlign:
                                                              TextAlign.center,
                                                          // style: TextStyle(
                                                          //     fontWeight:
                                                          //         FontWeight.bold),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          'Elev. Gain',
                                                          textAlign:
                                                              TextAlign.center,
                                                          // style: TextStyle(
                                                          //     fontWeight:
                                                          //         FontWeight.bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          snapshot.data[index]
                                                                  ['distance']
                                                              .toString()
                                                              .toUpperCase(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          snapshot.data[index][
                                                                  'total_elevation_gain']
                                                              .toString()
                                                              .toUpperCase(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Moving Time',
                                                          textAlign:
                                                              TextAlign.center,
                                                          // style: TextStyle(
                                                          //     fontWeight:
                                                          //         FontWeight.bold),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          'Elapsed Time',
                                                          textAlign:
                                                              TextAlign.center,
                                                          // style: TextStyle(
                                                          //     fontWeight:
                                                          //         FontWeight.bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          snapshot.data[index][
                                                                  'moving_time']
                                                              .toString()
                                                              .toUpperCase(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          snapshot.data[index][
                                                                  'elapsed_time']
                                                              .toString()
                                                              .toUpperCase(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Divider(
                                                    thickness: 2,
                                                    // color: Colors.black,
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        child: Icon(
                                                          Icons.thumb_up,
                                                          color:
                                                              Colors.grey[500],
                                                          size: 20,
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          snapshot.data[index][
                                                                  'kudos_count']
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          // style: TextStyle(
                                                          //     fontWeight:
                                                          //         FontWeight.bold),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Icon(
                                                          Icons
                                                              .comment_outlined,
                                                          color:
                                                              Colors.grey[500],
                                                          size: 20,
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          snapshot.data[index][
                                                                  'comment_count']
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          // style: TextStyle(
                                                          //     fontWeight:
                                                          //         FontWeight.bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
