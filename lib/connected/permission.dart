import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../services/api_service.dart';

class PermissionScreen extends StatelessWidget {
  // const PermissionScreen({super.key});
  bool value = false;

  @override
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
            '',
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
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
              Container(
                  padding: EdgeInsets.only(
                      left: Adaptive.w(5),
                      right: Adaptive.w(5),
                      bottom: Adaptive.w(1)),
                  height: Adaptive.h(12),
                  width: Adaptive.w(100),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 157, 228, 234),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: Adaptive.w(55),
                              child: Text(
                                "STRAVA",
                                style: TextStyle(
                                    fontSize: 0.4.dp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: Adaptive.w(30),
                                  child: Image.asset('assets/clinical_my.png',
                                      // fit: BoxFit.fill,
                                      height: Adaptive.h(8),
                                      width: Adaptive.w(30)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Adaptive.h(1),
                        ),
                      ])),
              Container(
                padding: EdgeInsets.all(Adaptive.w(2)),
                height: 50.h,
                child: SafeArea(
                  child: FutureBuilder(
                    future: ApiService().fetchHighlight(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          padding: EdgeInsets.all(Adaptive.w(2)),
                          height: 130.h,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.0, vertical: 10),

                                        //body listview
                                        child: Container(
                                          height: Adaptive.h(35),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //       color: Colors.grey, //New
                                            //       blurRadius: 10.0,
                                            //       offset: Offset(-1, -1))
                                            // ],
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 1,
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(15),
                                                child: Text(
                                                  'Thousands of amazing developers from all over the world are making apps for Strava. Far more athletes are using those apps to augment their Strava experience. ',
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                    fontSize: 0.25.dp,
                                                    // fontWeight:
                                                    //     FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(15),
                                                child: Text(
                                                  'There’s an app for everyone, from those that let you dive deep into the nerdiest of performance data, to an app that helps you make a friend in your neighborhood who runs the same pace as you. Give one a try, but remember: We can’t promise they all work perfectly, and support for each app is entirely up to the developer.',
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                    fontSize: 0.25.dp,
                                                    // fontWeight:
                                                    //     FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ]),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(Adaptive.w(2)),
                  // height: 100.h,
                  child: SafeArea(
                      child: Center(
                    child: Container(
                      padding: EdgeInsets.all(Adaptive.w(2)),
                      child: Container(
                        color: Colors.amber,
                        height: Adaptive.h(5),
                        child: Text('checkbox'),
                      ),
                    ),
                  )))
            ])))));
  }
}
