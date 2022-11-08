import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/screens/health_status.dart';
import 'package:flutter_clinic/models/service.dart';
import 'package:flutter_clinic/screens/appointment/appointment_screen.dart';
import 'package:flutter_clinic/bmi/bmi_screen.dart';
import 'package:flutter_clinic/screens/highlight/article_details_show.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:flutter_clinic/screens/notification/no_noti_screens.dart';
import 'package:flutter_clinic/screens/notification/notification_main.dart';
import 'package:flutter_clinic/screens/notification/view_noti.dart';
import 'package:flutter_clinic/services/api_service.dart';
import 'package:gauges/main.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'find_clinic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future? fetchPanelList;
  Future? fetchHighlightIndex;

  @override
  void initState() {
    // TODO: implement initState
    fetchHighlightIndex = ApiService().fetchHighlightIndex();
    fetchPanelList = ApiService().fetchPanelList();

    super.initState();
  }

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(Adaptive.w(5)),
                height: Adaptive.h(26),
                decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Hi, $sharedFullName!",
                              style: TextStyle(
                                  fontSize: 0.3.dp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MainNotification()),
                              );
                            },
                          ),
                        ],
                      ),
                      Spacer(),
                      // Container(
                      //     padding: EdgeInsets.symmetric(horizontal: 10),
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.circular(20)),
                      //     child: TextField(
                      //       enabled: false,
                      //       decoration: InputDecoration(
                      //           contentPadding: EdgeInsets.only(left: 10),
                      //           // prefixIcon: Icon(Icons.search),
                      //           labelText: 'Search',
                      //           border: InputBorder.none),

                      //     ),

                      //     )
                    ],
                  ),
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
                            maxCrossAxisExtent: Adaptive.w(40),
                            mainAxisExtent: Adaptive.h(15),
                            // childAspectRatio: 5 / 4,
                            // crossAxisSpacing: 20,
                            mainAxisSpacing: 0),
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                      return AppointmentScreen();
                                    }));
                                  } else if (index == 2) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return FindClinicScreen();
                                    }));
                                  } else if (index == 3) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HealthStatusScreen();
                                    }));
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
                                style: TextStyle(fontSize: 0.246.dp),
                              )
                            ],
                          );
                        }),
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
                                height: screenHeight * 0.5,
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
                      Navigator.pop(context);
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
                      Navigator.pop(context);
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
                      Navigator.pop(context);
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
                      Navigator.pop(context);
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
                          'Tutorial',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
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
                          'Temperature',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
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
                          'Temperature',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      });
}
