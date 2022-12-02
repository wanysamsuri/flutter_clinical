import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:flutter_clinic/screens/health%20record/EMC_screen.dart';
import 'package:flutter_clinic/screens/health%20record/empty_state.dart';
import 'package:flutter_clinic/screens/home_screen.dart';
import 'package:flutter_clinic/screens/loading_screen.dart';
import 'package:flutter_clinic/screens/notification/noti_screens.dart';
import 'package:get/route_manager.dart';

import '../../customshape.dart';
import '../../services/api_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewNotification extends StatefulWidget {
  const ViewNotification({Key? key}) : super(key: key);

  @override
  State<ViewNotification> createState() => _ViewNotificationState();
}

class _ViewNotificationState extends State<ViewNotification> {
  TextEditingController nameController = TextEditingController();
  Future? futureNotification;
  int selected = -1;
  @override
  void initState() {
    super.initState();
    futureNotification = ApiService().fetchNotification();
  }

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
              'Notification',
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
          padding: EdgeInsets.only(top: Adaptive.w(1)),
          height: 130.h,
          child: SafeArea(
            child: FutureBuilder(
              future: ApiService().fetchNotification(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List notiList = snapshot.data;
                  if (snapshot.hasData) {
                    return (notiList.isNotEmpty)
                        ? Container(
                            padding: EdgeInsets.all(Adaptive.w(3)),
                            height: 130.h,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 0, vertical: 2.0),

                                              //body listview
                                              child: Container(
                                                height: 12.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 1,
                                                    ),
                                                    ListTile(
                                                      onTap: () async {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  NotificationScreen(
                                                                    id: snapshot
                                                                        .data[
                                                                            index]
                                                                            [
                                                                            'id']
                                                                        .toString(),
                                                                  )),
                                                        );
                                                        print(snapshot
                                                            .data[index]['id']);
                                                      },
                                                      title: Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 10,
                                                                    bottom: 10),
                                                            child: Center(
                                                              child: Text(
                                                                (snapshot.data[
                                                                            index]
                                                                        ['data']
                                                                    [
                                                                    'message']),
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                                maxLines: 1,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      subtitle: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 15.0),
                                                        child: Text(
                                                          (snapshot.data[index]
                                                                  ['data']
                                                              ['message']),
                                                          textAlign:
                                                              TextAlign.justify,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      trailing: IconButton(
                                                        icon: Icon(Icons
                                                            .navigate_next_sharp),
                                                        onPressed: () {
                                                          // ApiService()
                                                          //     .fetchNotificationById(
                                                          //         snapshot.data[
                                                          //                 index]
                                                          //             ['id']);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }))
                                ]),
                          )
                        : Center(
                            child: EmptyStateScreen(),
                          );
                  } else if (snapshot.hasError) {
                    print('has error');
                    return Center(
                      child: Text('error'),
                    );
                  } else {
                    print('Empty');
                    return Center(
                      child: Text('Empty'),
                    );
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }
}
