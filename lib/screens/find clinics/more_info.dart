import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../customshape.dart';
import '../../services/api_service.dart';

class MoreInfoScreen extends StatefulWidget {
  const MoreInfoScreen({Key? key}) : super(key: key);

  @override
  State<MoreInfoScreen> createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
  Future? futurefetchPanels;
  int selected = -1;
  @override
  void initState() {
    // TODO: implement initState
    futurefetchPanels = ApiService().fetchPanels('3.05453', '101.48533');
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
                            Container(
                              padding: EdgeInsets.all(20),
                              child: const Text(
                                "Show in map",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
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

                                        child: Container(
                                          height: Adaptive.h(23),
                                          decoration: BoxDecoration(
                                              color: secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Container(
                                            padding: EdgeInsets.all(20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          child: Text(
                                                        snapshot.data['data']
                                                            [index]['name'],
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: Adaptive.w(60),
                                                      child: Text(
                                                        snapshot.data['data']
                                                            [index]['address'],
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                        width: Adaptive.w(60),
                                                        child: Text(
                                                          snapshot.data['data']
                                                              [index]['city'],
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                        width: Adaptive.w(60),
                                                        child: Text(
                                                          snapshot.data['data']
                                                              [index]['state'],
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                        width: Adaptive.w(60),
                                                        child: Text(
                                                          snapshot.data['data']
                                                              [index]['phone'],
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                        width: Adaptive.w(60),
                                                        child: Text(
                                                          snapshot.data['data']
                                                                  [index]
                                                              ['website'],
                                                          style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 16,
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }))
                          ]));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
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
                          

