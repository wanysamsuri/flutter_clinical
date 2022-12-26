import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/pedometer/pedometer_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StepMainScreen extends StatefulWidget {
  const StepMainScreen({super.key});

  @override
  State<StepMainScreen> createState() => _StepMainScreenState();
}

class _StepMainScreenState extends State<StepMainScreen> {
  Widget currentValue = Text('From latest to newest');
  List<PopupMenuEntry<Widget>> _items = [
    PopupMenuItem(
      child: Text('From latest to newest'),
      value: Text('From latest to newest'),
    ),
    PopupMenuItem(
      child: Text('From newest to latest'),
      value: Text('From newest to latest'),
    )
  ];

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
              'Step Counter',
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
        // bottomNavigationBar: Container(
        //   child: BottomAppBar(
        //     color: primaryColor,
        //     child: InkWell(
        //       child: Container(
        //         height: Adaptive.h(6),
        //         color: Colors.transparent,
        //         child: Container(
        //           color: primaryColor,
        //           child: Center(
        //             child: Text(
        //               'Record',
        //               style: TextStyle(
        //                 fontSize: 0.27.dp,
        //                 // fontWeight: FontWeight.bold
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       onTap: () {},
        //     ),
        //   ),
        // ),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 0.0,
          icon: const Icon(Icons.add, color: Colors.black),
          label: const Text(
            'Record',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: primaryColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PedometerScreen()));
          },
          // shape: BeveledRectangleBorder(
          //     borderRadius: BorderRadius.circular(5),
          //     side: const BorderSide(color: Colors.grey)
          //     ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 15, left: 8.0, right: 8.0, bottom: 15.0),
                    child: Text(
                      'Today',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      height: Adaptive.h(18),
                      width: screenWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: secondaryColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey, //New
                                blurRadius: 10.0,
                                offset: Offset(0, 0))
                          ]),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Image.asset('assets/footstep.png'),
                              // child: LineChart(LineChartData(
                              //     minX: 0,
                              //     maxX: 5,
                              //     minY: 0,
                              //     maxY: 5,
                              //     lineBarsData: [
                              //       LineChartBarData(spots: [FlSpot(0, 3)])
                              //     ])),
                            ),
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Center(
                                  child: Container(
                                    child: Text('Steps'),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Text(
                                    '1001',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Previous',
                          style: TextStyle(fontSize: 18),
                        ),
                        Container(
                            child: PopupMenuButton<Widget>(
                          icon: Icon(Icons.sort),
                          onSelected: (newValue) {
                            currentValue = newValue;
                          },
                          itemBuilder: (context) {
                            return _items;
                          },
                        ))
                        // IconButton(
                        //   icon: Icon(Icons.sort),
                        //   onPressed: () {},
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(Adaptive.w(2)),
                    // height: Adaptive.h(30),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.0, vertical: 10),

                                  //body listview
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    height: Adaptive.h(10),
                                    // width: screenWidth,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row( 
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            // SizedBox(
                                            //   height: 1,
                                            // ),

                                            Container(
                                              child: Text(
                                                'Steps: 104',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  // fontWeight:
                                                  //     FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),

                                            Container(
                                              child: Text(
                                                '17/12/2022',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  // fontWeight:
                                                  //     FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          child: Text('tah lah'),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}