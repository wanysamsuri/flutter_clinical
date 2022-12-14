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
import 'package:skeleton_text/skeleton_text.dart';

import '../constant.dart';
import '../record_screen.dart';
import '../screens/empty_state_screen.dart';
import '../screens/profile/edit_password.dart';
import '../screens/profile/edit_profile.dart';
import '../services/api_service.dart';

class SalixiumScreen extends StatefulWidget {
  const SalixiumScreen({Key? key, required String serviceName})
      : super(key: key);

  @override
  State<SalixiumScreen> createState() => _SalixiumScreenState();
}

class _SalixiumScreenState extends State<SalixiumScreen> {
  Future? futureFetchSalixium;
  @override
  void initState() {
    // TODO: implement initState
    futureFetchSalixium = ApiService().fetchSalixium();
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
            'SALIXIUM',
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
              Navigator.pop(context);
            },
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 10),
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
                          future: futureFetchSalixium,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount: 3,
                                padding: EdgeInsets.all(10),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 5,
                                ),
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: Colors.white,
                                    shadowColor: Colors.grey[300],
                                    elevation: 3.0,
                                    // margin: EdgeInsets.all(30),
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Color(0xFFEEEEEE),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: SkeletonAnimation(
                                        shimmerDuration: 500,
                                        child: Container(
                                          height: 300,
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.only(
                                              right: 20,
                                              left: 20,
                                              top: 10,
                                              bottom: 20),
                                          // color: Colors.grey,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 10,
                                                // width: 200,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                              SizedBox(
                                                height: 1,
                                              )
                                            ],
                                          ),
                                        )),
                                  );
                                },
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                List salixiumList = snapshot.data;
                                print('has data');
                                return (salixiumList.isNotEmpty)
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        // gridDelegate:
                                        //     SliverGridDelegateWithFixedCrossAxisCount(
                                        //         crossAxisCount: 2),
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.all(10),
                                            padding: EdgeInsets.only(
                                                right: 20,
                                                left: 20,
                                                top: 10,
                                                bottom: 20),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Stack(children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // color: Colors.amber,
                                                    child: Text(
                                                      snapshot.data[index]
                                                              ['date_time']
                                                          .toString()
                                                          .toUpperCase(),
                                                      // overflow: TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.justify,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: Adaptive.h(2),
                                                  ),
                                                  Container(
                                                    // color: Colors.amber,
                                                    child: Text(
                                                      'SARS-CoV-2 (COVID-19) - Test Results',
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
                                                        child: Flexible(
                                                          child: Text(
                                                            snapshot.data[index]
                                                                    ['name']
                                                                .toString()
                                                                .toUpperCase(),
                                                            overflow:
                                                                TextOverflow
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
                                                          'IC/ID:',
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
                                                            snapshot.data[index]
                                                                    ['ic_no']
                                                                .toString()
                                                                .toUpperCase(),
                                                            overflow:
                                                                TextOverflow
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
                                                          'Sample ID:',
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
                                                            snapshot.data[index]
                                                                    ['pin']
                                                                .toString()
                                                                .toUpperCase(),
                                                            overflow:
                                                                TextOverflow
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
                                                  SizedBox(
                                                    height: Adaptive.h(1),
                                                  ),
                                                  Divider(
                                                    thickness: 2,
                                                  ),
                                                  SizedBox(
                                                    height: Adaptive.h(1),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    // color: Colors.white,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Stack(children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            // color: Colors.amber,
                                                            child: Text(
                                                              'Result:',
                                                              // overflow: TextOverflow.ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                Adaptive.h(1),
                                                          ),
                                                          Container(
                                                            // color: Colors.amber,
                                                            child: Center(
                                                              child: Text(
                                                                snapshot
                                                                    .data[index]
                                                                        [
                                                                        'result']
                                                                    .toString()
                                                                    .toUpperCase(),
                                                                // overflow: TextOverflow.ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        26,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ]),
                                                  ),
                                                ],
                                              ),
                                            ]),
                                          );
                                        })
                                    : Center(
                                        child: EmptyStateScreen(),
                                      );
                              } else if (snapshot.hasError) {
                                print('has error');
                                return Center(
                                  child: Text('error'),
                                );
                              } else {
                                print('Empty');
                                return Center(
                                  child: EmptyStateScreen(),
                                );
                              }
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
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
