import 'dart:ui';

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

class ViewTestScreen extends StatefulWidget {
  const ViewTestScreen({Key? key, required String serviceName})
      : super(key: key);

  @override
  State<ViewTestScreen> createState() => _ViewTestScreenState();
}

class _ViewTestScreenState extends State<ViewTestScreen> {
  Future? futureClinicTest;
  @override
  void initState() {
    // TODO: implement initState
    futureClinicTest = ApiService().fetchClinicTest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: screenHeight * 0.07,
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
          flexibleSpace: ClipPath(
              //clipper: CustomShape(),
              child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 157, 228, 234),
          )),
          title: const Text(
            'View Test',
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
      body: Padding(
        padding: const EdgeInsets.all(5),
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
                          future: futureClinicTest,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  // gridDelegate:
                                  //     SliverGridDelegateWithFixedCrossAxisCount(
                                  //         crossAxisCount: 2),
                                  itemCount: snapshot.data['data'].length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.only(
                                            right: 20,
                                            left: 20,
                                            top: 10,
                                            bottom: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Stack(children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: Adaptive.h(2),
                                                ),
                                                Container(
                                                  // color: Colors.amber,
                                                  child: Text(
                                                    'Test Result',
                                                    // overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),

                                                  // SizedBox(
                                                  //   height: Adaptive.h(1),
                                                  // ),
                                                ),
                                                SizedBox(
                                                  height: Adaptive.h(1),
                                                ),
                                                Divider(
                                                  thickness: 2,
                                                ),
                                                SizedBox(
                                                  height: Adaptive.h(1),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      // width: 40,
                                                      // color: Colors.amber,
                                                      child: Text(
                                                        'Name:',
                                                        // overflow: TextOverflow.ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            // fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Adaptive.w(1),
                                                    ),
                                                    Container(
                                                      // color: Colors.amber,
                                                      child: Text(
                                                        snapshot.data['data']
                                                            [index]['name'],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                            // fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      // width: 40,
                                                      // color: Colors.amber,
                                                      child: Text(
                                                        'Type:',
                                                        // overflow: TextOverflow.ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            // fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Adaptive.w(1),
                                                    ),
                                                    Container(
                                                      // color: Colors.amber,
                                                      child: Flexible(
                                                        child: Text(
                                                          snapshot.data['data']
                                                              [index]['type'],
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                              // fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      // width: 40,
                                                      // color: Colors.amber,
                                                      child: Text(
                                                        'Result:',
                                                        // overflow: TextOverflow.ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            // fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Adaptive.w(1),
                                                    ),
                                                    Container(
                                                      // color: Colors.amber,
                                                      child: Flexible(
                                                        child: Text(
                                                          snapshot.data['data']
                                                              [index]['result'],
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                              // fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      // width: 40,
                                                      // color: Colors.amber,
                                                      child: Text(
                                                        'Remarks:',
                                                        // overflow: TextOverflow.ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            // fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Adaptive.w(1),
                                                    ),
                                                    Container(
                                                      // color: Colors.amber,
                                                      child: Flexible(
                                                        child: Text(
                                                          snapshot.data['data']
                                                                  [index]
                                                              ['remarks'],
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                              // fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                        ]));
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
