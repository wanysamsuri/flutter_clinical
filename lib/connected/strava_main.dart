import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/connected/strava_activity.dart';
import 'package:flutter_clinic/connected/strava_profile.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/screens/appointment/history_appointment_record.dart';
import 'package:flutter_clinic/screens/appointment/new_appointment_record.dart';

import '../../customshape.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StravaMainScreen extends StatefulWidget {
  const StravaMainScreen({Key? key, required String serviceName})
      : super(key: key);

  @override
  State<StravaMainScreen> createState() => _StravaMainScreenState();
}

class _StravaMainScreenState extends State<StravaMainScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        body: Container(
          // color: Colors.amber ,
          child: Padding(
            padding: EdgeInsets.all(Adaptive.w(2)),
            child: Column(
              children: [
                TabBar(
                    indicator: BoxDecoration(
                        color: Color.fromARGB(255, 3, 205, 219),
                        borderRadius: BorderRadius.circular(25)),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                        text: 'Activities',
                      ),
                      Tab(
                        text: 'Profile',
                      ),
                    ]),
                Expanded(
                    child: TabBarView(children: [
                  StravaActivityScreen(serviceName: ''),
                  StravaProfileScreen(
                    serviceName: '',
                  ),
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
