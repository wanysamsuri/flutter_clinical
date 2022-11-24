import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/health%20status/health_status.dart';
import 'package:flutter_clinic/health%20status/new_record.dart';
import 'package:flutter_clinic/health%20status/test_screens.dart';
import 'package:flutter_clinic/models/appointment_service.dart';
import 'package:flutter_clinic/models/health_choice.dart';
import 'package:flutter_clinic/models/health_status_model.dart';
import 'package:flutter_clinic/screens/appointment/choice_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../screens/notification/view_noti.dart';

class HealthTestScreen extends StatefulWidget {
  const HealthTestScreen({super.key});

  @override
  State<HealthTestScreen> createState() => _HealthTestScreenState();
}

class _HealthTestScreenState extends State<HealthTestScreen> {
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
            //clipper: CustomShape(),
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
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: primaryColor,
        child: InkWell(
          child: Container(
            height: Adaptive.h(6),
            color: Colors.transparent,
            child: Container(
              color: primaryColor,
              child: Center(
                  child:
                      Text('Add New Record', style: TextStyle(fontSize: 18))),
            ),
          ),
          onTap: () {
            showModalBottomSheet(
                // isScrollControlled: true,
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                  20,
                ))),
                builder: ((context) => Container(
                      padding: EdgeInsets.all(Adaptive.h(2)),
                      height: Adaptive.h(55),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              child: Center(
                            child: Text(
                              'Add New Record',
                              style: TextStyle(
                                  fontSize: 0.26.dp,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                          SizedBox(
                            height: Adaptive.h(3),
                          ),
                          Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(
                                    left: Adaptive.w(0),
                                    right: Adaptive.w(0),
                                  ),
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              mainAxisSpacing: 5,
                                              crossAxisSpacing: 10),
                                      itemCount: healthStatus.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.0, vertical: 4),

                                          //body listview
                                          child: InkWell(
                                            child: Center(
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                height: Adaptive.h(15),
                                                width: Adaptive.w(40),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: Colors.grey[200],
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color:
                                                              Colors.grey, //New
                                                          blurRadius: 10.0,
                                                          offset: Offset(
                                                              -0.5, -0.5))
                                                    ]),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Image.asset(
                                                          healthStatus[index]
                                                              .image
                                                              .toString(),
                                                          width: 40,
                                                          height: 40,
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Container(
                                                        // padding:
                                                        //     EdgeInsets.only(
                                                        //         left: 5),
                                                        child: Center(
                                                          child: Text(
                                                            healthStatus[index]
                                                                .serviceName
                                                                .toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize:
                                                                  Adaptive.dp(
                                                                      0.22),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          NewRecordScreen()));
                                            },
                                          ),
                                        );
                                      })),
                            ],
                          ),
                        ],
                      ),
                    )));
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(Adaptive.w(5)),
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
                        Text(
                          "Health Status",
                          style: TextStyle(
                              fontSize: 0.3.dp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Adaptive.h(1),
                        ),
                        Text(
                          "Track all your health aspects",
                          style: TextStyle(
                              fontSize: 0.25.dp, fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
                SizedBox(
                  height: Adaptive.h(3),
                ),
                Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: healthStatus.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.0, vertical: 10),

                            //body listview
                            child: InkWell(
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: Adaptive.h(10),
                                  width: Adaptive.w(90),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey[200],
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey, //New
                                            blurRadius: 5.0,
                                            offset: Offset(-0.1, -0.1))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Center(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Image.asset(
                                              healthStatus[index]
                                                  .image
                                                  .toString(),
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Adaptive.w(7),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: Adaptive.w(2)),
                                          child: Text(
                                            healthStatus[index]
                                                .serviceName
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TestScreen(
                                              serviceName: '',
                                            )));
                              },
                            ),
                          );
                        })),
                SizedBox(
                  height: Adaptive.h(4),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: Adaptive.w(5), right: Adaptive.w(5)),
                  child: Text(
                    'MORE FROM MYCLINICAL',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Container(
                    padding: EdgeInsets.only(
                      left: Adaptive.w(5),
                      right: Adaptive.w(5),
                    ),
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        itemCount: healthChoice.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 1),

                            //body listview
                            child: InkWell(
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: Adaptive.h(15),
                                  width: Adaptive.w(40),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey[200],
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey, //New
                                            blurRadius: 5.0,
                                            offset: Offset(-0.1, -0.1))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Image.asset(
                                                healthChoice[index]
                                                    .image
                                                    .toString(),
                                                width: 40,
                                                height: 40,
                                              ),
                                            ),
                                            SizedBox(
                                              height: Adaptive.h(1),
                                            ),
                                            Container(
                                              child: Text(
                                                healthChoice[index]
                                                    .serviceName
                                                    .toString(),
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
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TestScreen(
                                              serviceName: '',
                                            )));
                              },
                            ),
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
