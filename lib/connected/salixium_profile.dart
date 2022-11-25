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

class SalixiumProfileScreen extends StatefulWidget {
  const SalixiumProfileScreen({Key? key, required String serviceName})
      : super(key: key);

  @override
  State<SalixiumProfileScreen> createState() => _SalixiumProfileScreenState();
}

class _SalixiumProfileScreenState extends State<SalixiumProfileScreen> {
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
        // backgroundColor: Colors.grey,
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
                              // color: Colors.grey[200]
                            ),
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
                          Divider(
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 5,
                          ),
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
                                    'Fullname:',
                                    style: TextStyle(
                                      // letterSpacing: 5,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      // color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    snapshot.data['fullname'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Adaptive.h(2)),
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
                                    'Username:',
                                    style: TextStyle(
                                      // letterSpacing: 5,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      // color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
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
                              ],
                            ),
                          ),
                          SizedBox(height: Adaptive.h(2)),
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
                                    'Sex:',
                                    style: TextStyle(
                                      // letterSpacing: 5,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      // color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    snapshot.data['sex'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
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
                                onPressed: () {},
                              ),
                            ),
                          ),
                          SizedBox(height: Adaptive.h(5)),
                          Container(
                            // height: 10,
                            child: Text(
                              snapshot.data['created_at'],
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ]));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })));
  }
}
