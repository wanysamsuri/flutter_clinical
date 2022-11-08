import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/health%20status/view_status.dart';
import 'package:flutter_clinic/screens/home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key, required String serviceName}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
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
              'TEST',
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
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(Adaptive.w(3)),
                    height: Adaptive.h(120),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: screenHeight * 0.02,
                          // ),
                          // const Text(
                          //   'TEST',
                          //   style: TextStyle(
                          //       fontSize: 20, fontWeight: FontWeight.bold),
                          // ),
                          // SizedBox(
                          //   height: screenHeight * 0.02,
                          // ),

                          //

                          // SizedBox(
                          //   height: screenHeight * 0.02,
                          // ),
                          Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                // SizedBox(
                                //   height: screenHeight * 0.02,
                                // ),
                                const Text(
                                  'MEASUREMENT',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                const Text(
                                  'Current',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.03,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewStatusScreen()));
                                  },
                                  child: Container(
                                    height: Adaptive.h(20),
                                    //margin: EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey, //New
                                            blurRadius: 10.0,
                                            offset: Offset(-5, -5))
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '__ unit',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: Adaptive.w(65)),
                                            Column(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Icon(
                                                        Icons.arrow_forward_ios,
                                                        size: 20),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   height: screenHeight * 0.02,
                                // ),
                                // const Text(
                                //   'TEST',
                                //   style: TextStyle(
                                //       fontSize: 20,
                                //       fontWeight: FontWeight.bold),
                                // ),
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),

                                SizedBox(
                                  height: screenHeight * 0.04,
                                ),
                                const Text(
                                  'Previous',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: Adaptive.w(30),
                                            //margin: EdgeInsets.all(10),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.calendar_month),
                                                    SizedBox(width: 20),
                                                    Column(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text('Sort by'),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.03,
                                ),

                                ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: 3,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: screenHeight * 0.02,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewStatusScreen()));
                                        },
                                        child: Container(
                                          height: Adaptive.h(20),
                                          //margin: EdgeInsets.all(10),
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey, //New
                                                  blurRadius: 10.0,
                                                  offset: Offset(-5, -5))
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '__ unit',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                      width: Adaptive.w(65)),
                                                  Column(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              size: 20),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    })

                                // Container(
                                //   height: Adaptive.h(20),
                                //   //margin: EdgeInsets.all(10),
                                //   padding: const EdgeInsets.all(20),
                                //   decoration: BoxDecoration(
                                //     color: secondaryColor,
                                //     borderRadius: BorderRadius.circular(20),
                                //     boxShadow: [
                                //       BoxShadow(
                                //           color: Colors.grey, //New
                                //           blurRadius: 10.0,
                                //           offset: Offset(-5, -5))
                                //     ],
                                //   ),
                                //   child: Column(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Row(
                                //         children: [
                                //           Text(
                                //             '__ unit',
                                //             style: TextStyle(
                                //                 fontSize: 18,
                                //                 fontWeight: FontWeight.bold),
                                //           ),
                                //           SizedBox(width: Adaptive.w(45)),
                                //           // Column(
                                //           //   children: [
                                //           //     Column(
                                //           //       crossAxisAlignment:
                                //           //           CrossAxisAlignment.end,
                                //           //       children: [
                                //           //         Icon(Icons.arrow_forward_ios,
                                //           //             size: 20),
                                //           //       ],
                                //           //     ),
                                //           //   ],
                                //           // ),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: screenHeight * 0.02,
                                // ),
                              ])),
                        ])))));
  }
}
