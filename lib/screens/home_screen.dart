import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/connected/strava_permission.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/health%20status/health_status.dart';
import 'package:flutter_clinic/health%20status/health_test.dart';
import 'package:flutter_clinic/health%20status/new_record.dart';
import 'package:flutter_clinic/models/service.dart';
import 'package:flutter_clinic/pedometer/pedometer_screen.dart';
import 'package:flutter_clinic/pedometer/step_screen.dart';
import 'package:flutter_clinic/screens/appointment/appointment_screen.dart';
import 'package:flutter_clinic/bmi/bmi_screen.dart';
import 'package:flutter_clinic/screens/highlight/article_details_show.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:flutter_clinic/screens/notification/no_noti_screens.dart';
import 'package:flutter_clinic/screens/notification/notification_main.dart';
import 'package:flutter_clinic/screens/notification/view_noti.dart';
import 'package:flutter_clinic/services/api_service.dart';
import 'package:gauges/main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../connected/salixium_permission.dart';
import 'find clinics/find_clinic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late var lat;
  // late var long;
  // var locationMessage = "";
  // void getCurrentLocation() async {
  //   LocationPermission permission;
  //   permission = await Geolocator.requestPermission();
  //   var position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   var lastPosition = await Geolocator.getLastKnownPosition();
  //   print(lastPosition);
  //   lat = position.latitude.toString();
  //   long = position.longitude.toString();
  //   print('$lat, $long');

  //   setState(() {
  //     lat = position.latitude.toString();
  //     long = position.longitude.toString();
  //     locationMessage = '$position';
  //   });
  // }
  // getCurrentLocation() async {
  //   SharedPreferences storage = await SharedPreferences.getInstance();
  //   LocationPermission permission;
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.deniedForever) {
  //       return Future.error('Location Not Available');
  //     }
  //   }
  //   var position = await Geolocator.getCurrentPosition();
  //   // desiredAccuracy: LocationAccuracy.high);
  //   var lastPosition = Geolocator.getLastKnownPosition();
  //   print(lastPosition);
  //   await storage.setString('latitude', position.latitude.toString());
  //   await storage.setString('longitude', position.longitude.toString());
  //   print('Latitude from home : ${storage.getString('latitude')}');
  //   // lat = position.latitude.toString();
  //   // long = position.longitude.toString();
  //   // print('$lat, $long');

  //   // setState(() {
  //   //   lat = position.latitude.toString();
  //   //   long = position.longitude.toString();
  //   //   locationMessage = '$position';
  //   // });
  // }

  Future? fetchPanelList;
  Future? fetchHighlightIndex;

  @override
  void initState() {
    // TODO: implement initState
    fetchHighlightIndex = ApiService().fetchHighlight();
    fetchPanelList = ApiService().fetchPanelList();
    // getCurrentLocation();
    super.initState();
  }

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        // flexibleSpace: ClipPath(
        //   // clipper: CustomShape(),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     color: Color.fromARGB(255, 157, 228, 234),
        //   ),
        // ),
        title: Image.asset('assets/Clinical-Logo.png',
            fit: BoxFit.contain, height: Adaptive.h(3), width: Adaptive.w(30)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ViewNotification()),
                );
              }),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(Adaptive.w(5)),
                // height: Adaptive.h(10),
                width: Adaptive.w(100),
                decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$sharedFullName!",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    // const Spacer(),
                    // Spacer(),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 10),
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(20)),
                    //   child: TextField(
                    //     enabled: false,
                    //     decoration: InputDecoration(
                    //         contentPadding: EdgeInsets.only(left: 10),
                    //         prefixIcon: Icon(Icons.search),
                    //         labelText: 'Search',
                    //         border: InputBorder.none),
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: Adaptive.h(4),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Adaptive.w(4.5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: Adaptive.w(30),
                            mainAxisExtent: Adaptive.h(15),
                            // childAspectRatio: 5 / 4,
                            // crossAxisSpacing: 20,
                            mainAxisSpacing: 0),
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return BMIScreen();
                                    }));
                                  } else if (index == 1) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      // return AppointmentScreen();
                                      return FindClinicScreen(
                                          // getCurrentLocation()
                                          );
                                    }));
                                  } else if (index == 2) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      // return FindClinicScreen(
                                      //     getCurrentLocation());
                                      return HealthTestScreen();
                                    }));
                                  } else if (index == 3) {
                                    _showBottomSheet(context);
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) {
                                    //   return HealthStatusScreen();
                                    // }));
                                  } else if (index == 4) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Scaffold(
                                        appBar: AppBar(
                                          backgroundColor: primaryColor,
                                        ),
                                      );
                                    }));
                                  } else {
                                    _showBottomSheet(context);
                                  }
                                },
                                child: Container(
                                    height: Adaptive.h(9),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primaryColor,
                                    ),
                                    child: Icon(
                                      services[index].icon,
                                      size: 30,
                                    )),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                services[index].serviceName.toString(),
                                style: TextStyle(fontSize: Adaptive.sp(14)),
                              )
                            ],
                          );
                        }),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    const Text(
                      "Step Counter",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
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
                        child: InkWell(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Image.asset(
                                      'assets/footstep.png',
                                      height: Adaptive.h(20),
                                      width: Adaptive.w(20),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Today',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Adaptive.h(2),
                                      ),
                                      Container(
                                        child: Text('Steps'),
                                      ),
                                      Container(
                                        child: Text(
                                          '-',
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
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StepMainScreen()));
                            })),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    const Text(
                      "Latest Articles",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    FutureBuilder(
                        future: fetchHighlightIndex,
                        builder: (context, AsyncSnapshot snapshot) {
                          // return Text('data');
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                height: screenHeight * 0.48,
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, highlightIndex) {
                                    // (highlightIndex > snapshot.data.length)?
                                    return InkWell(
                                      onTap: () {
                                        Get.to(() => ArticleDetailsShow(
                                              articleId: snapshot
                                                  .data[highlightIndex]['id']
                                                  .toString(),
                                            ));
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             HighlightDetailScreen(
                                        //               id: snapshot.data[
                                        //                       highlightIndex]
                                        //                       ['id']
                                        //                   .toString(),
                                        //             )));
                                      },
                                      child: Container(
                                          width: 250,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.2),
                                                        spreadRadius: 0.1,
                                                        blurRadius: 2,
                                                        offset: const Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                    color: Colors.white,
                                                    // borderRadius: const BorderRadius
                                                    //         .only(
                                                    //     bottomLeft: Radius
                                                    //         .circular(
                                                    //             10),
                                                    //     bottomRight: Radius
                                                    //         .circular(
                                                    //             10))
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      width: 300,
                                                      height: 200,
                                                      child:
                                                          // Icon(
                                                          //   Icons.article,
                                                          //   size: 80,
                                                          // )
                                                          CachedNetworkImage(
                                                        imageUrl: snapshot.data[
                                                                    highlightIndex]
                                                                ['media'][0]
                                                            ['original_url'],
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                        ),
                                                        placeholder:
                                                            (BuildContext
                                                                        context,
                                                                    String
                                                                        url) =>
                                                                const Center(
                                                          child: SizedBox(
                                                            width: 30,
                                                            height: 30,
                                                            child:
                                                                CircularProgressIndicator(),
                                                          ),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                                Icons.error),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            snapshot.data[
                                                                    highlightIndex]
                                                                ['name'],
                                                            maxLines: 2,
                                                          ),
                                                          // Text(
                                                          //     snapshot.data[
                                                          //             highlightIndex]
                                                          //         [
                                                          //         'title'],
                                                          //     maxLines:
                                                          //         2,
                                                          //     style:
                                                          //         const TextStyle(
                                                          //       fontWeight:
                                                          //           FontWeight.w500,
                                                          //     )),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            snapshot.data[
                                                                    highlightIndex]
                                                                ['subtitle'],
                                                            maxLines: 3,
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 12),
                                                          ),
                                                          // const SizedBox(
                                                          //   height: 5,
                                                          // ),

                                                          // Text(
                                                          //     snapshot.data[
                                                          //             highlightIndex]
                                                          //         [
                                                          //         'subtitle'],
                                                          //     overflow:
                                                          //         TextOverflow
                                                          //             .ellipsis,
                                                          //     style: const TextStyle(
                                                          //         color: Colors
                                                          //             .grey,
                                                          //         fontSize:
                                                          //             12)),
                                                          // const SizedBox(
                                                          //   height: 10,
                                                          // ),
                                                          SizedBox(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 40,
                                                            child: ListView
                                                                .builder(
                                                                    shrinkWrap:
                                                                        true,
                                                                    physics:
                                                                        const BouncingScrollPhysics(),
                                                                    scrollDirection:
                                                                        Axis
                                                                            .horizontal,
                                                                    // itemCount:
                                                                    //     5,
                                                                    itemCount: snapshot
                                                                        .data[
                                                                            highlightIndex]
                                                                            [
                                                                            'tags']
                                                                        .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return Container(
                                                                        margin: const EdgeInsets.only(
                                                                            right:
                                                                                10,
                                                                            top:
                                                                                10),
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            color: Colors.grey.withOpacity(0.2)),
                                                                        padding: const EdgeInsets.only(
                                                                            right:
                                                                                8.0,
                                                                            left:
                                                                                8.0),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              // Text('tags'),
                                                                              Text(
                                                                            snapshot.data[highlightIndex]['tags'][index]['name'],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                    );

                                    // :  Text('data');
                                  },
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error');
                            } else {
                              return Text('Empty');
                            }
                          } else {
                            return Text('State: ${snapshot.connectionState}');
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext test) {
        return Wrap(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'More',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.grey,
                  ),
                  InkWell(
                    child: Container(
                      child: ListTile(
                        leading: const Icon(
                          Icons.medication,
                          size: 30,
                          color: Colors.black,
                        ),
                        title: Text(
                          'Body Mass Index',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BMIScreen()));
                      ;
                    },
                  ),
                  InkWell(
                    child: Container(
                      child: ListTile(
                        leading: const Icon(
                          Icons.medication,
                          size: 30,
                          color: Colors.black,
                        ),
                        title: Text(
                          'Book Appointment',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppointmentScreen()));
                      ;
                    },
                  ),
                  InkWell(
                    child: Container(
                      child: ListTile(
                        leading: const Icon(
                          Icons.medication,
                          size: 30,
                          color: Colors.black,
                        ),
                        title: Text(
                          'Find Clinic',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FindClinicScreen()));
                      ;
                    },
                  ),
                  InkWell(
                    child: Container(
                      child: ListTile(
                        leading: const Icon(
                          Icons.medication,
                          size: 30,
                          color: Colors.black,
                        ),
                        title: Text(
                          'Health Status',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HealthTestScreen()));
                      ;
                    },
                  ),
                  InkWell(
                    child: Container(
                      child: ListTile(
                        leading: const Icon(
                          Icons.medication,
                          size: 30,
                          color: Colors.black,
                        ),
                        title: Text(
                          'Step Counter',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StepMainScreen()));
                      ;
                    },
                  ),
                  InkWell(
                    child: Container(
                      child: ListTile(
                        leading: const Icon(
                          Icons.medication,
                          size: 30,
                          color: Colors.black,
                        ),
                        title: Text(
                          'Strava',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StravaPermissionScreen()));
                      ;
                    },
                  ),
                  InkWell(
                    child: Container(
                      child: ListTile(
                        leading: const Icon(
                          Icons.medication,
                          size: 30,
                          color: Colors.black,
                        ),
                        title: Text(
                          'Salixium',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SalixiumPermissionScreen()));
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      });
}
