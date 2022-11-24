import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/connected/strava_activitiy.dart';
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

class StravaProfileScreen extends StatefulWidget {
  const StravaProfileScreen({Key? key, required String serviceName})
      : super(key: key);

  @override
  State<StravaProfileScreen> createState() => _StravaProfileScreenState();
}

class _StravaProfileScreenState extends State<StravaProfileScreen> {
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
              'STRAVA',
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
        body: SafeArea(
            child: FutureBuilder(
                future: ApiService().fetchUserStrava(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: ListView(children: [
                        SizedBox(height: 10),
                        Center(
                          child: Stack(children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: screenWidth * 0.03,
                                ),
                                Align(
                                  child: Container(
                                    height: Adaptive.h(20),
                                    width: Adaptive.w(30),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                snapshot.data['profile']))),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(10),
                          // height: Adaptive.h(9),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[200]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Hello,',
                                  style: TextStyle(
                                    letterSpacing: 5,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    snapshot.data['username'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Adaptive.h(2)),
                        Container(
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(130, 45),
                                primary: Color.fromARGB(255, 157, 228, 234),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              child: Text(
                                'Edit',
                                style: TextStyle(fontSize: 18),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StravaActivityScreen(
                                                serviceName: '')));
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Divider(
                          thickness: 2,
                        ),
                        // SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.all(10),
                          // width: Adaptive.w(12),
                          // height: Adaptive.h(20),
                          // color: Colors.amber,
                          child: FutureBuilder(
                              future: futureFetchStravaActivity,
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      // gridDelegate:
                                      //     SliverGridDelegateWithFixedCrossAxisCount(
                                      //         crossAxisCount: 2),
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          //                 child: Text(
                                          //   'Activities',
                                          //   style: TextStyle(
                                          //     letterSpacing: 3,
                                          //     fontSize: 16,
                                          //     fontWeight: FontWeight.bold,
                                          //     color: Colors.black,
                                          //   ),
                                          // ),
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color: secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Container(
                                            height: Adaptive.h(5),
                                            width: Adaptive.w(20),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    snapshot.data[index]['name']
                                                        .toString()
                                                        .toUpperCase(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    snapshot.data[index]['type']
                                                        .toString()
                                                        .toUpperCase(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    snapshot.data[index]
                                                            ['distance']
                                                        .toString()
                                                        .toUpperCase(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    snapshot.data[index]
                                                            ['moving_time']
                                                        .toString()
                                                        .toUpperCase(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        ),
                      ]),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })));
  }
}
